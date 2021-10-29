cmake_minimum_required(VERSION 3.07)
set(PROJECT_NAME "size_plugin")
set(CMAKE_CXX_STANDARD 17) # Use C++17 lib
#set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS 1)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set (CMAKE_INCLUDE_CURRENT_DIR ON)
project(${PROJECT_NAME} LANGUAGES CXX)


# This value is used when generating builds using this plugin, so it must
# not be changed
set(PLUGIN_NAME "size_plugin")
#set(HEADER_FILES "${CMAKE_CURRENT_SOURCE_DIR}/size_plugin.h")
#target_include_directories(${PLUGIN_NAME} INTERFACE ${HEADER_FILES} )
#message(${HEADER_FILES})
add_library(${PLUGIN_NAME} SHARED
  "size_plugin.cc"
)
apply_standard_settings(${PLUGIN_NAME})
set_target_properties(${PLUGIN_NAME} PROPERTIES
  CXX_VISIBILITY_PRESET hidden)
target_compile_definitions(${PLUGIN_NAME} PRIVATE FLUTTER_PLUGIN_IMPL)
target_include_directories(${PLUGIN_NAME} INTERFACE
  "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(${PLUGIN_NAME} PRIVATE flutter PkgConfig::GTK)
#target_link_libraries(${PLUGIN_NAME} PRIVATE flutter)
#target_include_directories(${PLUGIN_NAME} PUBLIC ${HEADER_FILES} )
# List of absolute paths to libraries that should be bundled with the plugin
set(size_bundled_libraries
  ""
  PARENT_SCOPE
)

#target_link_libraries(${PLUGIN_NAME} PRIVATE size)
