#include <cstddef>
namespace goto_flow {

template <typename T> void quick_sort(T *arr, std::size_t size);

namespace quick_impl {
template <typename T> void sort(T *arr, int low, int high);
template <typename T> int partition(T *arr, int low, int high);
template <typename T> void swap(T &a, T &b);

template <typename T> void sort(T *arr, int low, int high) {
  if (low < high) {
    int pi = partition(arr, low, high);
    sort(arr, low, pi - 1);
    sort(arr, pi + 1, high);
  }
}

template <typename T> int partition(T *arr, int low, int high) {
  T pivot = arr[high];
  int i = low - 1;

  for (int j = low; j <= high - 1; j++) {
    if (arr[j] < pivot) {
      i++;
      swap(arr[i], arr[j]);
    }
  }

  swap(arr[i + 1], arr[high]);
  return i + 1;
}
template <typename T> void swap(T &a, T &b) {
  T temp = a;
  a = b;
  b = temp;
}
} // namespace quick_impl

template <typename T> void quick_sort(T *arr, std::size_t size) {
  quick_impl::sort(arr, 0, size - 1);
}
} // namespace goto_flow