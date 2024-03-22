find_package(Doxygen REQUIRED)

set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in)
set(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)

set(DOXYGEN_INPUT_DIR ${PROJECT_SOURCE_DIR}/include/${PROJECT_NAME})
set(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/doxygen)
set(DOXYGEN_INDEX_FILE ${DOXYGEN_OUTPUT_DIR}/html/index.html)
file(GLOB_RECURSE project_public_headers ${DOXYGEN_INPUT_DIR}/*.h)

# Replace variables inside @@ with the current values
configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)

file(MAKE_DIRECTORY ${DOXYGEN_OUTPUT_DIR}) # Doxygen won't create this for us

add_custom_command(OUTPUT ${DOXYGEN_INDEX_FILE}
                   DEPENDS ${project_public_headers}
                   COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
                   MAIN_DEPENDENCY ${DOXYFILE_OUT} ${DOXYFILE_IN}
                   COMMENT "Generating docs")

add_custom_target(${PROJECT_NAME}_doxygen ALL DEPENDS ${DOXYGEN_INDEX_FILE})

set(SPHINX_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/sphinx-source)
set(SPHINX_BUILD ${CMAKE_CURRENT_BINARY_DIR}/sphinx)
set(SPHINX_PROGRAM "sphinx-build")

# The poetry (dependency) installation is performed below as part of the target's command sequence.
# The order of operations is important: 1. Install sphinx/breathe as part of the project's dependencies
# 2. Find or assert the path to sphinx, 3. Run sphinx/breathe
# Note that "poetry run" during CMake's build phase does not activate an environment installed
# during CMake's configuration phase!

add_custom_target(${PROJECT_NAME}_sphinx ALL
                  COMMAND poetry install
                  COMMAND poetry run ${SPHINX_PROGRAM} -b html
                  -Dbreathe_projects.${PROJECT_NAME}=${DOXYGEN_OUTPUT_DIR}/xml
                  ${SPHINX_SOURCE} ${SPHINX_BUILD}
                  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
                  COMMENT "Generating documentation with Sphinx")