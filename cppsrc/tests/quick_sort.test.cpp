#include "algorithms/quick_sort.hpp"
#include "helpers.hpp"

#include <gtest/gtest.h>
#define BIG_LEN 10000

TEST(QuickSortTest, QuickSortTest) {
  int arr[] = {12, 11, 13, 5, 6, 7};
  int n = sizeof(arr) / sizeof(arr[0]);

  goto_flow::quick_sort(arr, n);

  ASSERT_EQ(arr[0], 5);
  ASSERT_EQ(arr[1], 6);
  ASSERT_EQ(arr[2], 7);
  ASSERT_EQ(arr[3], 11);
  ASSERT_EQ(arr[4], 12);
  ASSERT_EQ(arr[5], 13);
}

TEST(QuickSortTest, BigInputTest) {
  int arr[BIG_LEN];
  for (int i = 0; i < BIG_LEN; i++) {
    arr[i] = BIG_LEN - i;
  }

  goto_flow::quick_sort(arr, BIG_LEN);

  for (int i = 0; i < BIG_LEN; i++) {
    ASSERT_EQ(arr[i], i + 1);
  }
}

TEST(QuickSortTest, BigInputRandomTest) {
  int arr[BIG_LEN];
  goto_flow::helpers::randomized_array(arr, BIG_LEN);
  goto_flow::quick_sort(arr, BIG_LEN);
  goto_flow::helpers::is_sorted(arr, BIG_LEN);
}