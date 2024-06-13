#make a list of all submodules in .gitmodules
macro(make_submodules_list)
  if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
    set(git_modules_file "${PROJECT_SOURCE_DIR}/.gitmodules")
    if (EXISTS ${git_modules_file})
      file(STRINGS ${git_modules_file} file_lines)
      set(submoduleNames)
      foreach(line ${file_lines})
        if (${line} MATCHES "url =")
          string(REGEX REPLACE "\\s*url = .*/(.*).git" "\\1" name "${line}")
          string(STRIP "${name}" name)
          if (DEFINED submoduleNames)
            set(submoduleNames ${submoduleNames} ${name})
          else()
            set(submoduleNames ${name})
          endif()
        endif()
      endforeach()
    endif()
  endif()
endmacro()

#update the named submodule
macro(update_submodule arg)
  if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${arg}")
    message(FATAL_ERROR "Submodule directory \"${CMAKE_CURRENT_SOURCE_DIR}/${arg}\" does not exist")
  endif()

  # Initialize submodule if it hasn't already been cloned
  if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${arg}/.git")
    message(STATUS "Initialize ${arg} submodule")
    execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init --recursive "${CMAKE_CURRENT_SOURCE_DIR}/${arg}"
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
            RESULT_VARIABLE GIT_SUBMOD_RESULT)
    if(NOT GIT_SUBMOD_RESULT EQUAL "0")
      message(FATAL_ERROR "git submodule update --init --recursive ${CMAKE_CURRENT_SOURCE_DIR}/${arg} failed with ${GIT_SUBMOD_RESULT}, please checkout submodules")
    endif()
  endif()
endmacro()

#update all submodules listed in .gitmodules
macro(initialize_submodules)
  make_submodules_list()
  if (DEFINED submoduleNames)
    foreach (submoduleName ${submoduleNames})
      update_submodule(${submoduleName})
    endforeach()
    unset(submoduleNames)
  endif()
endmacro()

#update the name submodule iff it is listed in .gitmodules
macro(initialize_submodule arg)
  make_submodules_list()
  if (DEFINED submoduleNames)
    foreach (submoduleName ${submoduleNames})
      if("${submoduleName}" MATCHES "${arg}")
        update_submodule(${submoduleName})
      endif()
    endforeach()
    unset(submoduleNames)
  endif()
endmacro()
