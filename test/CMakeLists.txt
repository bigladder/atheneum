include_directories("${PROJECT_SOURCE_DIR}/src"
  "${PROJECT_SOURCE_DIR}/include"
  "${gtest_SOURCE_DIR}/include")

set(test_sources ${PROJECT_NAME}_tests.cpp)

add_executable(${PROJECT_NAME}_tests ${test_sources})

target_link_libraries(${PROJECT_NAME}_tests ${PROJECT_NAME} gtest)

include(GoogleTest)
gtest_discover_tests(${PROJECT_NAME}_tests)