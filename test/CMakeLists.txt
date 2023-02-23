include_directories("${PROJECT_SOURCE_DIR}/src"
  "${PROJECT_SOURCE_DIR}/include"
  "${gtest_SOURCE_DIR}/include")

set(test_sources ${PROJECT_NAME}_tests.cpp)

add_executable(${PROJECT_NAME}_tests ${test_sources})

target_link_libraries(${PROJECT_NAME}_tests PRIVATE ${PROJECT_NAME} gtest ${PROJECT_NAME}_interface_library)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_tests)