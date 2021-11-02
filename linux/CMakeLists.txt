cmake_minimum_required(VERSION 3.15)
set(PROJECT_NAME "size_plugin_lib")
project(${PROJECT_NAME} LANGUAGES CXX)


# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "size_plugin")
add_library(${PLUGIN_NAME} SHARED
  "size_plugin_lib.cc"
  #"src/size_lib.cpp" # Tries to link the lib
)

apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
#  "${CMAKE_CURRENT_SOURCE_DIR}/src")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter PkgConfig::GTK)
#target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
# List of absolute paths to libraries that should be bundled with the plugin
set(size_bundled_libraries
  "$<TARGET_FILE:size>"
  PARENT_SCOPE
)

#message("${CMAKE_BINARY_DIR}\n ${CMAKE_CURRENT_SOURCE_DIR}")
add_subdirectory(src) # Build original
#target_link_libraries(${PLUGIN_NAME} PRIVATE size)

