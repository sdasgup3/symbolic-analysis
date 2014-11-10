#ifndef _MMAP_RT_H_
#define _MMAP_RT_H_

namespace jitflow {
namespace shadow {

void allocMem();
label_t *getLabelBase(const void *ptr);

}
}

#endif // _MMAP_RT_H_
