#update the named submodule
macro(update_submodule module_name)
  if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${module_name}")
    message(FATAL_ERROR "Submodule directory \"${CMAKE_CURRENT_SOURCE_DIR}/${module_name}\" does not exist")
  endif()

  # Initialize submodule if it hasn't already been cloned
  if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${module_name}/.git")
    message(STATUS "Initialize ${module_name} submodule")
    execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init "${CMAKE_CURRENT_SOURCE_DIR}/${module_name}"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            RESULT_VARIABLE GIT_SUBMOD_RESULT)
    if(NOT GIT_SUBMOD_RESULT EQUAL "0")
      message(FATAL_ERROR "git submodule update --init ${CMAKE_CURRENT_SOURCE_DIR}/${module_name} failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
    endif()
  endif()
endmacro()

#update the named submodule iff it is listed in .gitmodules
macro(add_submodule module_name)
  if (NOT TARGET ${module_name}) # Don't clone or add subdirectory if the module/target already exists
    update_submodule(${module_name}) # Maybe this could be expanded in this macro instead of being a separate macro?
    add_subdirectory(${module_name})
  endif()
endmacro()
