set(test_sources ${PROJECT_NAME}_tests.cpp)

add_executable(${PROJECT_NAME}_tests ${test_sources})

set_target_properties(${PROJECT_NAME}_tests PROPERTIES CXX_CLANG_TIDY "${CLANG_TIDY_COMMAND}")
target_link_libraries(${PROJECT_NAME}_tests ${PROJECT_NAME} gtest)
target_compile_features(${PROJECT_NAME}_tests PRIVATE cxx_std_17)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_tests)