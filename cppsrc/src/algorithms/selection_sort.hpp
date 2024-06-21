namespace goto_flow {

template <typename T> void selection_sort(T *arr, size_t size) {
  for (int i = 0; i < size - 1; i++) {
    int min_index = i;
    for (int j = i + 1; j < size; j++) {
      if (arr[j] < arr[min_index]) {
        min_index = j;
      }
    }
    T temp = arr[min_index];
    arr[min_index] = arr[i];
    arr[i] = temp;
  }
}

} // namespace goto_flow
}