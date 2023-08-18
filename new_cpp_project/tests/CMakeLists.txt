project(tests)

add_executable(${PROJECT_NAME}
        main.cpp
)
target_link_libraries(${PROJECT_NAME} PRIVATE ${CATCH2_MAIN})
target_link_libraries(${PROJECT_NAME} PRIVATE
        NavidCoreLib
)
