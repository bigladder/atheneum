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

add_custom_target(Doxygen ALL DEPENDS ${DOXYGEN_INDEX_FILE})

set(SPHINX_SOURCE ${CMAKE_CURRENT_SOURCE_DIR}/sphinx-source)
set(SPHINX_BUILD ${CMAKE_CURRENT_BINARY_DIR}/sphinx)
set(SPHINX_PROGRAM "sphinx-build")

# Creating a poetry environment during the configuration phase would be ideal, but the subsequent
# build-phase commands don't seem to activate the same environment before running tasks.
# As a result, the install is performed below as part of the target's command sequence.
# We can only look for executables installed as part of the poetry environment (sphinx-build)
# after the install, so we can't use find_program or similar to get the most general path.
# Fortunately the poetry environment is minimal, so paths like ${SPHINX_PROGRAM} can be assumed.

add_custom_target(Sphinx ALL
                  COMMAND poetry install
                  COMMAND poetry run ${SPHINX_PROGRAM} -b html
                  -Dbreathe_projects.${PROJECT_NAME}=${DOXYGEN_OUTPUT_DIR}/xml
                  ${SPHINX_SOURCE} ${SPHINX_BUILD}
                  WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
                  COMMENT "Generating documentation with Sphinx")