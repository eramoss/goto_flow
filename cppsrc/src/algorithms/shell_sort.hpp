#pragma once

#include "insertion_sort.hpp"
#include <cstddef>

#define GAPS 8
namespace goto_flow {
template <typename T> void shell_sort(T *arr, size_t size);

namespace shell_impl {
template <typename T> void sort(T *arr, size_t size, int *gaps) {
  for (int g = 0; g < GAPS; g++) {
    int gap = gaps[g];
    for (int i = gap; i < size; i++) {
      goto_flow::insertion_sort(arr, size);
    }
  }
}
} // namespace shell_impl
template <typename T> void shell_sort(T *arr, size_t size) {
  int *ciura_gaps = new int[GAPS]{701, 301, 132, 57, 23, 10, 4, 1};
  shell_impl::sort(arr, size, ciura_gaps);
}

} // namespace goto_flow