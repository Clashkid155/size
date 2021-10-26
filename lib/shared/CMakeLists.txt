cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17) # Use C++17 lib
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS 1)
set(CMAKE_BUILD_TYPE RELEASE)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
project(size_library VERSION 1.0.0 LANGUAGES CXX)
add_library(size SHARED src/fsize.cpp)
#add_executable(size_test src/fsize.cpp)




