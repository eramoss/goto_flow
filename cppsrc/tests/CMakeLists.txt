cmake_minimum_required(VERSION VERSION 3.28)
project(testsGotoFlow)

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz
)
FetchContent_MakeAvailable(googletest)

file(GLOB TEST_SOURCES "*.cpp")

add_executable(goto_flow_tests ${TEST_SOURCES})

include_directories(goto_flow_tests ${CMAKE_SOURCE_DIR}/src)

target_link_libraries(goto_flow_tests PRIVATE gtest gtest_main)

enable_testing()

add_test(NAME unit_tests COMMAND goto_flow_tests)
