include_directories("${PROJECT_SOURCE_DIR}/src"
  "${PROJECT_SOURCE_DIR}/include"
  "${gtest_SOURCE_DIR}/include")

set(test_sources atheneum_tests.cpp)

link_libraries(${CMAKE_PROJECT_NAME} gtest)

add_executable(${CMAKE_PROJECT_NAME}_tests ${test_sources})

include(GoogleTest)
gtest_discover_tests(${CMAKE_PROJECT_NAME}_tests)