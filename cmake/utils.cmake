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

function(set_version major minor patch phase build)
    SET(MAJOR ${major})
    SET(MINOR ${minor})
    SET(PATCH ${patch})
    SET(PHASE ${phase})
    SET(BUILD ${build})
endfunction()
