#include "algorithms/bubble_sort.hpp"
#include "algorithms/insertion_sort.hpp"
#include "algorithms/merge_sort.hpp"
#include "algorithms/quick_sort.hpp"
#include "algorithms/selection_sort.hpp"
#include "algorithms/shell_sort.hpp"

#include "benchmark.hpp"
#include "helpers.hpp"
#include <iostream>

template <typename Func>
void aggregate_benchmark(goto_flow::Benchmark<Func> &bench,
                         int **arr_random_arrays, size_t n,
                         int random_arrays_amount) {
  std::chrono::nanoseconds average_time_of_execution(0);
  std::chrono::nanoseconds min_time(0);
  std::chrono::nanoseconds max_time(0);
  std::chrono::nanoseconds stddev_time(0);

  for (int i = 0; i < random_arrays_amount; i++) {
    bench.set_output(false);
    bench.run("random", arr_random_arrays[i], n);
    average_time_of_execution += bench.average_time_of_execution;
    min_time += bench.min_time;
    max_time += bench.max_time;
    stddev_time += bench.stddev_time;
  }

  average_time_of_execution /= random_arrays_amount + 1;
  min_time /= random_arrays_amount + 1;
  max_time /= random_arrays_amount + 1;
  stddev_time /= random_arrays_amount + 1;

  bench.average_time_of_execution = average_time_of_execution;
  bench.min_time = min_time;
  bench.max_time = max_time;
  bench.stddev_time = stddev_time;

  bench.set_output(true);
  bench.print_statistics("Random Aggregated");
}

void reset_arrays(int **random_arrays, int *arr_sorted, int *arr_reversed,
                  int n, int random_arrays_amount) {
  for (int i = 0; i < random_arrays_amount; i++) {
    goto_flow::helpers::randomized_array(random_arrays[i], n);
  }
  goto_flow::helpers::ordered_array(arr_sorted, n);
  goto_flow::helpers::reversed_array(arr_reversed, n);
}

int main(int argc, char const *argv[]) {
  std::cout << "How many elements do you want to sort? ";
  int n;
  std::cin >> n;
  std::cout << std::endl;
  std::cout << "How many times do you want to run the algorithm? ";
  int times;
  std::cin >> times;
  std::cout << std::endl;
  std::cout << "How many random arrays do you want to create? ";
  int random_arrays_amount;
  std::cin >> random_arrays_amount;

  std::cout << std::endl;

  int **random_arrays = new int *[random_arrays_amount];
  int *arr_sorted = new int[n];
  int *arr_reversed = new int[n];
  for (int i = 0; i < random_arrays_amount; i++) {
    random_arrays[i] = new int[n];
  }

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark bubble_bench(
      [](int arr[], int n) { goto_flow::bubble_sort(arr, n); }, "Bubble Sort",
      times);

  aggregate_benchmark(bubble_bench, random_arrays, n, random_arrays_amount);
  bubble_bench.run("reversed", arr_reversed, n);
  bubble_bench.run("sorted", arr_sorted, n);

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark insertion_bench(
      [](int arr[], int n) { goto_flow::insertion_sort(arr, n); },
      "Insertion Sort", times);

  aggregate_benchmark(insertion_bench, random_arrays, n, random_arrays_amount);
  insertion_bench.run("reversed", arr_reversed, n);
  insertion_bench.run("sorted", arr_sorted, n);

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark merge_bench(
      [](int arr[], int n) { goto_flow::merge_sort(arr, n); }, "Merge Sort",
      times);

  aggregate_benchmark(merge_bench, random_arrays, n, random_arrays_amount);
  merge_bench.run("reversed", arr_reversed, n);
  merge_bench.run("sorted", arr_sorted, n);

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark quick_bench(
      [](int arr[], int n) { goto_flow::quick_sort(arr, n); }, "Quick Sort",
      times);

  aggregate_benchmark(quick_bench, random_arrays, n, random_arrays_amount);
  quick_bench.run("reversed", arr_reversed, n);
  quick_bench.run("sorted", arr_sorted, n);

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark selection_bench(
      [](int arr[], int n) { goto_flow::selection_sort(arr, n); },
      "Selection Sort", times);

  aggregate_benchmark(selection_bench, random_arrays, n, random_arrays_amount);
  selection_bench.run("reversed", arr_reversed, n);
  selection_bench.run("sorted", arr_sorted, n);

  reset_arrays(random_arrays, arr_sorted, arr_reversed, n,
               random_arrays_amount);

  goto_flow::Benchmark shell_bench(
      [](int arr[], int n) { goto_flow::shell_sort(arr, n); }, "Shell Sort",
      times);

  aggregate_benchmark(shell_bench, random_arrays, n, random_arrays_amount);
  shell_bench.run("reversed", arr_reversed, n);
  shell_bench.run("sorted", arr_sorted, n);

  return 0;
}