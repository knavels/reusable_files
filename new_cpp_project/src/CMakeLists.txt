cmake_minimum_required(VERSION 3.22)
project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# add_lib_from_git(
#         asl
#         https://github.com/knavels/asl.git
#         stable
# )
# add_lib_from_git(
#         utf8_tools
#         https://github.com/navid-lang/utf8_tools.git
#         main
# )

file(GLOB SOURCES
        main.cpp
)

# add_library(${PROJECT_NAME}
#         STATIC
#         ${SOURCES}
#         )
add_executable(${PROJECT_NAME}
        ${SOURCES}
        )
target_include_directories(${PROJECT_NAME} PUBLIC "./include")

# target_link_libraries(${PROJECT_NAME} PUBLIC asls)
# target_link_libraries(${PROJECT_NAME} PUBLIC utf8_tools)
