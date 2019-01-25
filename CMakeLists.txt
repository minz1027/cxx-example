cmake_minimum_required(VERSION 3.6.1)

set(CMAKE_CXX_FLAGS "-g -O0 -Wall -fprofile-arcs -ftest-coverage")
set(CMAKE_CXX_OUTPUT_EXTENSION_REPLACE ON)

add_library(myLibrary STATIC
        MyClass.cpp MyClass.h
        )

link_libraries(-pthread)

add_executable(helloWorld helloWorld.cpp)
target_link_libraries(helloWorld myLibrary)

enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

add_executable(MyClass_unittest MyClass_unittest.cpp)
target_link_libraries(MyClass_unittest ${GTEST_BOTH_LIBRARIES})

GTEST_ADD_TESTS(MyClass_unittest "--gtest_output=xml:MyClass_unittest.xml" MyClass_unittest.cpp)