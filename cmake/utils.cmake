###################################################################################
# Knavels Cmake Utils
# USAGE: add the following to the cmakelists.txt
# file(DOWNLOAD "https://raw.githubusercontent.com/knavels/reusable_files/main/cmake/utils.cmake"
#        "${CMAKE_CURRENT_BINARY_DIR}/utils.cmake")
# include(${CMAKE_CURRENT_BINARY_DIR}/utils.cmake)
###################################################################################

Include(FetchContent)

function(add_lib_from_git target git_url git_tag)
    FetchContent_Declare(
            ${target}
            GIT_REPOSITORY ${git_url}
            GIT_TAG ${git_tag}
    )
    FetchContent_MakeAvailable(${target})
endfunction()

add_lib_from_git(
        Catch2
        https://github.com/catchorg/Catch2.git
        v3.3.2
)

set(CATCH2_MAIN Catch2::Catch2WithMain)

function(add_prebuild_test target test_target)
    # Define the command to run the tests before building target
    add_custom_command(
            TARGET ${target}
            PRE_BUILD
            COMMAND ${test_target}
            COMMENT "Running unit tests..."
            VERBATIM
    )

    # Specify the dependency and command to run the tests
    add_dependencies(${target} ${test_target})
endfunction()

function(set_version major minor patch phase)
    SET(MAJOR ${major} PARENT_SCOPE)
    SET(MINOR ${minor} PARENT_SCOPE)
    SET(PATCH ${patch} PARENT_SCOPE)
    SET(PHASE ${phase} PARENT_SCOPE)
    string(TIMESTAMP TIMESTAMP "%Y%m%d.%H%M")

    SET(BUILD ${TIMESTAMP} PARENT_SCOPE)

    message("Version: ${major}.${minor}.${patch}-${phase}+${TIMESTAMP}")
endfunction()

function(generate_version)
    file(DOWNLOAD "https://raw.githubusercontent.com/knavels/reusable_files/main/cmake/templates/VERSION.in"
        "${CMAKE_CURRENT_BINARY_DIR}/VERSION.in")

    configure_file("${CMAKE_CURRENT_BINARY_DIR}/VERSION.in" "${CMAKE_SOURCE_DIR}/VERSION" ESCAPE_QUOTES)
endfunction()

function(set_and_generate_version major minor patch phase)
    set_version(major minor patch phase)
    generate_version()
endfunction()