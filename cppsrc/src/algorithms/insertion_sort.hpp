#include <cstddef>
namespace goto_flow {
template <typename T> void insertion_sort(T *arr, size_t size) {
  for (int i = 1; i < size; i++) {
    T key = arr[i];
    int j = i - 1;

    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }

    arr[j + 1] = key;
  }
}

} // namespace goto_flow