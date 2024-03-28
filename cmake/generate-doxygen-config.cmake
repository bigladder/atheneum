set(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/docs/Doxyfile.in)
set(DOXYFILE_OUT ${CMAKE_CURRENT_SOURCE_DIR}/doxygen.cfg)

message(STATUS ${DOXYFILE_IN})
message(STATUS ${DOXYFILE_OUT})

set(WARN_ON_DOC_ERROR "YES")
set(DOXYGEN_INPUT_DIR include/${PROJECT_NAME})
set(DOXYGEN_OUTPUT_DIR build)

# Replace variables inside @@ with the current values
configure_file(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)
