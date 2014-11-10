//===-- jf_checker_map.cpp - Runtime logic for the points-to checker ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This code contains the runtime logic needed to run the points-to checker for
// pointer analysis.
//
//===----------------------------------------------------------------------===//

#include "jfrt/jf.h"
#include "SplayTree.h"

#include <stdlib.h>

/// A unique identifier for an abstract location
typedef uint64_t loc_t;

struct TreeNode : public mozilla::SplayTreeNode<TreeNode> {
  void *start, *end;
  loc_t id;
  static intptr_t compare(const TreeNode &a, const TreeNode &b) {
    if (a.start <= b.start && b.start < a.end)
      return 0;
    if (b.start <= a.start && a.start < b.end)
      return 0;
    return intptr_t(a.start) - intptr_t(b.start);
  }
  TreeNode(void *start, size_t len)
  : start(start), end((void*)((char *)start + len)) {}

  void *operator new(size_t s) {
    return malloc(s);
  }

  void operator delete(void *ptr) {
    free(ptr);
  }
};

static mozilla::SplayTree<TreeNode, TreeNode> splayTree;

// This requires some explanation for what I'm about to do. On multithreaded
// code, we need to grab a lock around our data structure to be threadsafe. (Or
// we could use a CAS-based SplayTree, but that does not appear to exist based
// on some googling). However, if we're linked into a non-threadsafe program, we
// want this stuff to be no-ops: no need to even link with pthreads. Hence our
// abuse of weak symbols.

#include <pthread.h>

__attribute__((weak)) extern int pthread_mutex_lock(pthread_mutex_t *);
__attribute__((weak)) extern int pthread_mutex_unlock(pthread_mutex_t *);

namespace {
struct GlobalLock {
  GlobalLock() {
    if (pthread_mutex_lock) {
      int errno = pthread_mutex_lock(&mutex);
      if (errno != 0)
        ____jf_logger("Attempted lock returned %d\n", errno);
    }
  }
  ~GlobalLock() {
    if (pthread_mutex_unlock) {
      int errno = pthread_mutex_unlock(&mutex);
      if (errno != 0)
        ____jf_logger("Attempted unlock returned %d\n", errno);
    }
  }
  static pthread_mutex_t mutex;
};

pthread_mutex_t GlobalLock::mutex = PTHREAD_MUTEX_INITIALIZER;
}

extern "C" {
NOINLINE void ____jf_note_abstract_location(void *ptr, size_t size, loc_t id) {
  GlobalLock lock;
  TreeNode *node = new TreeNode(ptr, size);
  if (splayTree.contains(*node)) {
    TreeNode *result = splayTree.find(*node);
    //____jf_logger("Duplicate node: [%p, %llx) (%u) overlaps [%p, %p) (%u)\n",
    //  ptr, (size_t)ptr + size, id,
    //  result->start, result->end, result->id);
    splayTree.remove(*result);
  }
  //____jf_logger("Inserting %u for [%p, %llx)\n", id, ptr, (size_t)ptr + size);
  node->id = id;
  splayTree.insert(node);
}

NOINLINE void ____jf_free_abstract_location(void *ptr) {
  GlobalLock lock;
  TreeNode search(ptr, 1);
  if (!splayTree.contains(search)) {
    //____jf_logger("Cannot find node for %p!?\n", ptr);=
    return;
  }
  //____jf_logger("Freeing %p\n", ptr);
  TreeNode *result = splayTree.remove(search);
  delete result;
}

// This function is marked as const via attributes, which tells LLVM to make
// this be readnone. The optimizers will realize that calling this method with
// same argument will imply that it always return the same value, and therefore
// remove redundant calls.
NOINLINE __attribute__((const)) loc_t ____jf_test_abstract_location(void *ptr) {
  GlobalLock lock;
  TreeNode search(ptr, 1);
  TreeNode *result = splayTree.find(search);
  return result ? result->id : 0;
}
}
