cmake_minimum_required(VERSION 3.22)
project(NEW_PROJECT)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

file(DOWNLOAD "https://raw.githubusercontent.com/knavels/reusable_files/main/cmake/utils.cmake"
        "${CMAKE_CURRENT_BINARY_DIR}/utils.cmake")
include(${CMAKE_CURRENT_BINARY_DIR}/utils.cmake)

add_subdirectory(tests)
add_subdirectory(src)

set_and_generate_version(0 0 1 dev 1)
