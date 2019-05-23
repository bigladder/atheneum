# Main library
file(GLOB_RECURSE sources "${PROJECT_SOURCE_DIR}/src/[a-zA-Z]*.cpp")
file(GLOB_RECURSE public_headers "${PROJECT_SOURCE_DIR}/include/${CMAKE_PROJECT_NAME}/[a-zA-Z]*.h")
file(GLOB_RECURSE private_headers "${PROJECT_SOURCE_DIR}/src/[a-zA-Z]*.h")

set(library_sources
  ${sources}
  ${public_headers}
  ${private_headers}
)

include_directories(${PROJECT_SOURCE_DIR}/include)
include_directories(${PROJECT_SOURCE_DIR}/src)

option( ${CMAKE_PROJECT_NAME}_STATIC_LIB "Make penumbra a static library" ON )

if (${CMAKE_PROJECT_NAME}_STATIC_LIB)
  add_library(${CMAKE_PROJECT_NAME} STATIC ${library_sources})
  set_target_properties(${CMAKE_PROJECT_NAME} PROPERTIES COMPILE_FLAGS "-D${CMAKE_PROJECT_NAME}_STATIC_DEFINE")
else()
  set(CMAKE_MACOSX_RPATH 1)
  add_library(${CMAKE_PROJECT_NAME} SHARED ${library_sources})
endif()

include(GenerateExportHeader)
generate_export_header(${CMAKE_PROJECT_NAME})

# target_link_libraries(${CMAKE_PROJECT_NAME} vendor dependencies)

if (${CMAKE_PROJECT_NAME}_COVERAGE)
  add_coverage(${CMAKE_PROJECT_NAME})
endif()
