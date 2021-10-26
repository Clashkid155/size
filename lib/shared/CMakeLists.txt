cmake_minimum_required(VERSION 3.10)
#set(CMAKE_CXX_COMPILER "/usr/bin/g++")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
project(size_library VERSION 1.0.0 LANGUAGES CXX)
add_library(size SHARED src/fsize.cpp)
#add_executable(size_test src/fsize.cpp)

