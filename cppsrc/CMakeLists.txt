cmake_minimum_required(VERSION 3.28)
project(goto_flow)

set(CMAKE_CXX_STANDARD 17)

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()

add_executable(goto_flow src/goto_flow.cpp)
include_directories(src)

add_subdirectory(tests)
include(CTest)
add_test(NAME goto_flow_tests COMMAND $<TARGET_FILE:goto_flow_tests> --gtest_filter=* --gtest_color=no)
