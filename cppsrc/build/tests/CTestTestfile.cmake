# CMake generated Testfile for 
# Source directory: /home/eramoss/Fire/goto_flow/cppsrc/tests
# Build directory: /home/eramoss/Fire/goto_flow/cppsrc/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[unit_tests]=] "/home/eramoss/Fire/goto_flow/cppsrc/build/tests/goto_flow_tests")
set_tests_properties([=[unit_tests]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/eramoss/Fire/goto_flow/cppsrc/tests/CMakeLists.txt;21;add_test;/home/eramoss/Fire/goto_flow/cppsrc/tests/CMakeLists.txt;0;")
subdirs("../_deps/googletest-build")
