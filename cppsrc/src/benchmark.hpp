#include <chrono>
#include <cmath>
#include <cstddef>
#include <iostream>
#include <string>

namespace goto_flow {
template <typename Func> class Benchmark {
public:
  Benchmark(Func f, std::string name, size_t n = 1, bool output = false)
      : f(f), name(name), n(n), output(output) {
    min_time = std::chrono::nanoseconds::max();
    max_time = std::chrono::nanoseconds::min();
    std::chrono::nanoseconds total_time(0);
    double sum_of_squares = 0.0;

    for (size_t i = 0; i < n; ++i) {
      auto start = std::chrono::high_resolution_clock::now();
      f();
      auto end = std::chrono::high_resolution_clock::now();
      std::chrono::nanoseconds duration =
          std::chrono::duration_cast<std::chrono::nanoseconds>(end - start);

      total_time += duration;
      min_time = std::min(min_time, duration);
      max_time = std::max(max_time, duration);

      double diff = duration.count();
      sum_of_squares += diff * diff;
    }

    average_time_of_execution = total_time / n;
    double mean = average_time_of_execution.count();
    double variance = (sum_of_squares / n) - (mean * mean);
    stddev_time =
        std::chrono::nanoseconds(static_cast<long long>(std::sqrt(variance)));

    if (output) {
      print_statistics();
    }
  }

  void print_statistics() const {
    std::cout << "Benchmark results of " << name << ": (" << n
              << " runtimes)\n";
    std::cout << "Average time: " << average_time_of_execution.count()
              << " ns\n";
    std::cout << "Minimum time: " << min_time.count() << " ns\n";
    std::cout << "Maximum time: " << max_time.count() << " ns\n";
    std::cout << "Standard deviation: " << stddev_time.count() << " ns\n";
  }

private:
  Func f;
  size_t n;
  bool output;
  std::string name;

public:
  std::chrono::nanoseconds average_time_of_execution;
  std::chrono::nanoseconds min_time;
  std::chrono::nanoseconds max_time;
  std::chrono::nanoseconds stddev_time;
};
} // namespace goto_flow