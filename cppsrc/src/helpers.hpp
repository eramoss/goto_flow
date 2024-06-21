#include <cstddef>
#include <cstdlib>
#include <ctime>
#include <iostream>

namespace goto_flow {
namespace helpers {

template <typename T> void print_array(T *arr, size_t size) {
  std::cout << "[ ";
  for (int i = 0; i < size; i++) {
    std::cout << arr[i] << " ";
  }
  std::cout << "]" << std::endl;
}

template <typename T> void ordered_array(T *arr, size_t size) {
  for (int i = 0; i < size; i++) {
    arr[i] = i;
  }
}

template <typename T> void reversed_array(T *arr, size_t size) {
  for (int i = size; i > 0; i--) {
    arr[i] = i;
  }
}

template <typename T> void randomized_array(T *arr, size_t size) {
  for (int i = 0; i < size; i++) {
    arr[i] = rand() % size;
  }
}

template <typename T> bool is_sorted(T *arr, size_t size) {
  for (int i = 0; i < size - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      return false;
    }
  }
  return true;
}

} // namespace helpers
} // namespace goto_flow