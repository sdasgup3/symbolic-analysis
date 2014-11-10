//===-- wrappers_libc.cpp -------------------------------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Wrappers for recognized libc functions.
//
//===----------------------------------------------------------------------===//

#include "wrappers.h"

#include <algorithm>
#include <dirent.h>
#include <fcntl.h>
#include <limits.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>
#include <wchar.h>

// Declare these ourselves; stdio.h causes error due to conflict w/our jfdebug.
extern "C" int vsprintf(char *str, const char *format, va_list ap);
extern "C" int vsnprintf(char *str, size_t size, const char *format,
                         va_list ap);
extern "C" int vasprintf(char **strp, const char *fmt, va_list ap);

WRAPPER(void *, calloc)(size_t nmemb, label_t nt, size_t sz, label_t szt) {
  void *ptr = calloc(nmemb, sz);

  if (ptr)
    ____jf_set_label(ptr, nmemb * sz, LABEL_LOW);

  return ptr;
}

WRAPPER(void *, realloc)(void *ptr, label_t pt, size_t sz, label_t szt) {
  void *nptr = realloc(ptr, sz);

  // If memory moved, copy taint metadata to new area
  // Since we don't know size of original buffer,
  // move taint backing the entire area.
  // This is incorrect if the memory is used
  // uninitialized, but guarantees we get memory
  // that *is* initialized via this move.
  if (ptr && nptr && nptr != ptr)
    ____jf_copy_label(nptr, ptr, sz /* Should be size of old buf */, LABEL_LOW,
                      true);

  // TODO: Use pt/szt?

  return nptr;
}

WRAPPER(void *, memcpy)(void *dest, label_t dt, void *src, label_t st, size_t n,
                        label_t nt) {
  void *ptr = memcpy(dest, src, n);

  ____jf_copy_label(dest, src, n, LABEL_LOW, true);

  return ptr;
}

WRAPPER(void *, mempcpy)(void * dest, label_t dt, void * src, label_t st,
                         size_t n, label_t nt) {
  void *ptr = mempcpy(dest, src, n);

  ____jf_copy_label(dest, src, n, LABEL_LOW, true);

  return ptr;
}

WRAPPER(void *, memmove)(void *dest, label_t dt, void *src, label_t st,
                         size_t n, label_t nt) {
  void *ptr = memmove(dest, src, n);

  uint8_t *d = (uint8_t *)dest, *s = (uint8_t *)src;

  ____jf_copy_label(dest, src, n, LABEL_LOW, d < s);

  return ptr;
}

WRAPPER(void *, memset)(void *s, label_t st, int c, label_t ct, size_t n,
                        label_t nt) {
  void *ptr = memset(s, c, n);

  ____jf_set_label(ptr, n, LABEL_LOW);

  return ptr;
}

WRAPPER(char *, strcpy)(char *dest, label_t dt, const char *src, label_t st) {
  char *ptr = strcpy(dest, src);
  ____jf_copy_label(dest, src, strlen(src) + 1, LABEL_LOW, true);

  return ptr;
}

WRAPPER(char *, strncpy)(char *dest, label_t dt, const char *src, label_t st,
                         size_t n, label_t nt) {
  char *ptr = strncpy(dest, src, n);
  ____jf_copy_label(dest, src, n, LABEL_LOW, true);

  return ptr;
}

WRAPPER(char *, strcat)(char *dest, label_t dt, const char *src, label_t st) {
  size_t dlen = strlen(dest);
  strcpy(dest + dlen, src);
  ____jf_copy_label(dest + dlen, src, strlen(src) + 1, LABEL_LOW, true);

  return dest;
}

WRAPPER(char *, strncat)(char *dest, label_t dt, const char *src, label_t st,
                         size_t n, label_t nt) {
  size_t dlen = strlen(dest);
  strncat(dest, src, n);
  size_t dlen2 = strlen(dest);

  if (dlen2 != dlen) {
    ____jf_copy_label(dest + dlen, src, dlen2 - dlen, nt, true);
  }

  return dest;
}

WRAPPER(int, sprintf)(char *str, label_t st, const char *format, label_t ft,
                      ...) {
  va_list ap;
  va_start(ap, ft);
  int count = vsprintf(str, format, ap);
  va_end(ap);

  jfdebug("sprintf: fmt=|%s| (%s)...wrote %d to %p: |%s|\n", format,
          label2str(ft), count, str, str);

  if (count > 0)
    ____jf_set_label(str, count + 1, LABEL_LOW);

  return count;
}

WRAPPER(int, snprintf)(char *str, label_t st, size_t size, label_t szt,
                       const char *format, label_t ft, ...) {
  va_list ap;
  va_start(ap, ft);
  int count = vsnprintf(str, size, format, ap);
  va_end(ap);

  jfdebug("snprintf: fmt=|%s| (%s), sz=%d (%s)...wrote %d to %p: |%s|\n",
          format, label2str(ft), size, label2str(szt), count, str, str);

  if (count > 0)
    ____jf_set_label(str, std::min<size_t>(count + 1, size), LABEL_LOW);

  return count;
}

WRAPPER(size_t, mbrtowc)(wchar_t *pwc, label_t pwct, const char *s, label_t st,
                         size_t n, label_t nt, mbstate_t *ps, label_t pst) {
  size_t r = mbrtowc(pwc, s, n, ps);
  if (pwc && (r != ((size_t) - 1) && r != ((size_t) - 2)))
    ____jf_set_label(pwc, sizeof(wchar_t), LABEL_LOW);

  return r;
}

WRAPPER(ssize_t, read)(int fd, label_t fdt, void *buf, label_t bt, size_t count,
                       label_t ct) {
  ssize_t ret = read(fd, buf, count);

  if (ret > 0)
    ____jf_set_label(buf, ret, LABEL_LOW);

  return ret;
}

WRAPPER(size_t, fread)(void *ptr, label_t pt, size_t size, label_t st,
                       size_t nmemb, label_t nt, FILE *stream, label_t strt) {
  jfdebug("fread(ptr=%p, size=%zu, nmemb=%zu, stream=%p)\n", ptr, size, nmemb,
          stream);
  size_t ret = fread(ptr, size, nmemb, stream);
  if (ret != (size_t) - 1)
    ____jf_set_label(ptr, ret * size, LABEL_LOW);

  return ret;
}

WRAPPER(ssize_t, recv)(int socket, label_t st, void *buffer, label_t bt,
                       size_t length, label_t lt, int flags, label_t ft) {
  ssize_t ret = recv(socket, buffer, length, flags);
  if (ret > 0)
    ____jf_set_label(buffer, ret, LABEL_LOW);

  return ret;
}

WRAPPER(ssize_t, recvfrom)(int socket, label_t st, void *buffer, label_t bt,
                           size_t length, label_t lt, int flags, label_t ft,
                           struct sockaddr *address, label_t at,
                           socklen_t *address_len, label_t alt) {
  ssize_t ret = recvfrom(socket, buffer, length, flags, address, address_len);
  if (ret > 0)
    ____jf_set_label(buffer, ret, LABEL_LOW);

  return ret;
}

WRAPPER(ssize_t, recvmsg)(int socket, label_t st, struct msghdr *message,
                          label_t mt, int flags, label_t ft) {
  ssize_t ret = recvmsg(socket, message, flags);
  if (ret > 0)
    ____jf_set_label(message, ret, LABEL_LOW);

  return ret;
}

WRAPPER(char *, fgets)(char *s, label_t sl, int size, label_t st, FILE *stream,
                       label_t strl) {
  char *r = fgets(s, size, stream);
  if (r)
    ____jf_set_label(r, strlen(r), LABEL_LOW);

  return r;
}

WRAPPER(struct dirent *, readdir)(DIR *dirp, label_t dt) {
  struct dirent *ret = readdir(dirp);
  if (ret)
    ____jf_set_label(ret, sizeof(struct dirent), LABEL_LOW);

  return ret;
}

WRAPPER(int, stat)(const char *path, label_t lt, struct stat *buf, label_t bt) {
  int ret = stat(path, buf);
  if (ret == 0)
    ____jf_set_label(buf, sizeof(struct stat), LABEL_LOW);

  return ret;
}

WRAPPER(int, fstat)(int fd, label_t ft, struct stat *buf, label_t bt) {
  int ret = fstat(fd, buf);
  if (ret == 0)
    ____jf_set_label(buf, sizeof(struct stat), LABEL_LOW);

  return ret;
}

WRAPPER(void, bzero)(void *s, label_t st, size_t n, label_t nt) {
  bzero(s, n);
  ____jf_set_label(s, n, LABEL_LOW);
}

WRAPPER(void, bcopy)(const void *src, label_t st, void *dest, label_t dt,
                     size_t n, label_t nt) {
  bcopy(src, dest, n);
  ____jf_copy_label(dest, src, n, LABEL_LOW, dest < src);
}

WRAPPER(int, asprintf)(char **strp, label_t strpt, const char *fmt, label_t ft,
                       ...) {
  va_list ap;
  va_start(ap, ft);
  int count = vasprintf(strp, fmt, ap);
  va_end(ap);

  if (count > 0) {
    ____jf_set_label(*strp, count + 1, LABEL_LOW);
    ____jf_set_label(strp, sizeof(char *), LABEL_LOW);
  }

  return count;
}

WRAPPER(int, vasprintf)(char **strp, label_t strpt, const char *fmt, label_t ft,
                        va_list ap, label_t apt) {
  int count = vasprintf(strp, fmt, ap);

  if (count > 0) {
    ____jf_set_label(*strp, count + 1, LABEL_LOW);
    ____jf_set_label(strp, sizeof(char *), LABEL_LOW);
  }

  return count;
}

WRAPPER(int, vsprintf)(char *str, label_t st, const char *format, label_t ft,
                       va_list ap, label_t apt) {
  int count = vsprintf(str, format, ap);

  if (count > 0)
    ____jf_set_label(str, count + 1, LABEL_LOW);

  return count;
}

WRAPPER(int, vsnprintf)(char *str, label_t st, size_t size, label_t szt,
                        const char *format, label_t ft, va_list ap,
                        label_t at) {
  int count = vsnprintf(str, size, format, ap);

  if (count > 0)
    ____jf_set_label(str, std::min<size_t>(count + 1, size), LABEL_LOW);

  return count;
}

WRAPPER(void *, mmap)(void *addr, label_t at, size_t len, label_t lt, int prot,
                      label_t pt, int flags, label_t ft, int fildes,
                      label_t fdt, off_t off, label_t ot) {
  void *ret = mmap(addr, len, prot, flags, fildes, off);
  if (ret != MAP_FAILED)
    ____jf_set_label(ret, len, LABEL_LOW);

  return ret;
}

WRAPPER(void *, mremap)(void *old_address, label_t oat, size_t old_size,
                        label_t ost, size_t new_size, label_t nst, int flags,
                        label_t ft, ...) {
  va_list ap;
  va_start(ap, ft);
  void *new_addr = (flags & MREMAP_FIXED) ? va_arg(ap, void *) : NULL;
  va_end(ap);

  void *ret = mremap(old_address, old_size, new_size, flags, new_addr);
  if (ret != MAP_FAILED)
    ____jf_set_label(ret, new_size, LABEL_LOW);

  return ret;
}

WRAPPER(int, close)(int fd, label_t fdt) {
  int ret = close(fd);
  // Ensure we still have a logging fd
  ____jf_reinit_logger();
  return ret;
}

WRAPPER(int, fcntl)(int fd, label_t fdt, int cmd, label_t ct, ...) {
  // Read extra parameter regardless
  va_list ap;
  va_start(ap, ct);
  void *arg = va_arg(ap, void*);
  va_end(ap);
  int ret = fcntl(fd, cmd, arg);
  ____jf_reinit_logger();
  return ret;
}
