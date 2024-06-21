#include <cstddef>
namespace goto_flow {
template <typename T> void merge_sort(T *arr, size_t size);

namespace merge_impl {
template <typename T> void sort(T *arr, int l, int r);
template <typename T> void merge(T *arr, int l, int m, int r);

template <typename T> void sort(T *arr, int l, int r) {
  if (l < r) {
    int m = l + (r - l) / 2;
    sort(arr, l, m);
    sort(arr, m + 1, r);
    merge(arr, l, m, r);
  }
}

template <typename T> void merge(T *arr, int l, int m, int r) {
  int n1 = m - l + 1;
  int n2 = r - m;

  T L[n1], R[n2];
  for (int i = 0; i < n1; i++) {
    L[i] = arr[l + i];
  }
  for (int j = 0; j < n2; j++) {
    R[j] = arr[m + 1 + j];
  }

  int i = 0;
  int j = 0;
  int k = l;
  while (i < n1 && j < n2) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = L[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = R[j];
    j++;
    k++;
  }
}
} // namespace merge_impl
template <typename T> void merge_sort(T *arr, size_t size) {
  merge_impl::sort(arr, 0, size - 1);
}
} // namespace goto_flow