#update the named submodule
macro(update_submodule module_name module_path)
  if(NOT EXISTS "${module_path}")
    message(FATAL_ERROR "Submodule directory \"${module_path}\" does not exist")
  endif()

  # Initialize submodule if it hasn't already been cloned
  if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${module_name}/.git")
    message(STATUS "Initialize ${module_name} submodule")
    execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init "${module_path}"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            RESULT_VARIABLE GIT_SUBMOD_RESULT)
    if(NOT GIT_SUBMOD_RESULT EQUAL "0")
      message(FATAL_ERROR "git submodule update --init ${module_path} failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
    endif()
  endif()

  # Cannot use ARGN directly with list() command,
  # so copy it to a variable first.
  set (extra_args ${ARGN})

  # Did we get any optional args?
  list(LENGTH extra_args extra_count)
  if (${extra_count} GREATER 0)
    list(GET extra_args 0 optional_arg)
    message ("Got an optional arg: ${optional_arg}")
  endif ()

endmacro()

#update the named submodule iff it is listed in .gitmodules
macro(add_submodule module_name)

  #check of specific path is provided
  set(MacroArgs ${ARGN})
  list(LENGTH MacroArgs NumArgs)
  if(NumArgs GREATER 0)
    set(module_path ${ARGV1})
  else()
    set(module_path ${CMAKE_CURRENT_SOURCE_DIR}/${module_name})
  endif()
  message(${module_path})

  if (NOT TARGET ${module_name})
    update_submodule(${module_name} ${module_path})
    add_subdirectory(${module_path})
  endif()

endmacro()
