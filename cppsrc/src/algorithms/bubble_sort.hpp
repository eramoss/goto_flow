#include <cstddef>

namespace goto_flow {
template <typename T> void bubble_sort(T *arr, size_t size);

namespace bubble_impl {

template <typename T> void swap(T &a, T &b) {
  T temp = a;
  a = b;
  b = temp;
}
} // namespace bubble_impl

template <typename T> void bubble_sort(T *arr, size_t size) {
  bool swapped;
  for (int i = 0; i < size - 1; i++) {
    swapped = false;
    for (int j = 0; j < size - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        bubble_impl::swap(arr[j], arr[j + 1]);
        swapped = true;
      }
    }
    if (!swapped) {
      break;
    }
  }
}

} // namespace goto_flow