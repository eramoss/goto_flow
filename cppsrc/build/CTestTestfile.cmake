# CMake generated Testfile for 
# Source directory: /home/eramoss/Fire/goto_flow/cppsrc
# Build directory: /home/eramoss/Fire/goto_flow/cppsrc/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[goto_flow_tests]=] "/home/eramoss/Fire/goto_flow/cppsrc/build/tests/goto_flow_tests" "--gtest_filter=*" "--gtest_color=no")
set_tests_properties([=[goto_flow_tests]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/eramoss/Fire/goto_flow/cppsrc/CMakeLists.txt;15;add_test;/home/eramoss/Fire/goto_flow/cppsrc/CMakeLists.txt;0;")
subdirs("tests")
