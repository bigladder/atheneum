macro(add_submodule submodule_name)
    # Initialize a submodule and add it's subdirectory to the build (if the corresponding target hasn't already been added)
    set(options) # None
    set(one_value_args
            TARGET_NAME # Specify if target name is different from the submodule name
            PARENT_SUBMODULE_PATH # Specify if you want to leverage a submodule outside of this project's vendor directory
    )
    set(multi_value_args)
    cmake_parse_arguments(add_${submodule_name}_args "${options}" "${one_value_args}" "${multi_value_args}" ${ARGN})

    if (${add_${submodule_name}_args_TARGET_NAME})
        set(target_name ${add_${submodule_name}_args_TARGET_NAME})
    else ()
        set(target_name "${submodule_name}")
    endif ()

    if (${add_${submodule_name}_args_PARENT_SUBMODULE_PATH})
        set(submodule_path "${add_${submodule_name}_args_PARENT_SUBMODULE_PATH}/vendor/${submodule_name}")
    else ()
        set(submodule_path "${CMAKE_CURRENT_SOURCE_DIR}/${submodule_name}")
        if (GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
            message(STATUS "Updating submodule \"${submodule_name}\"")
            execute_process(COMMAND ${GIT_EXECUTABLE} submodule update --init "${submodule_path}"
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    RESULT_VARIABLE GIT_SUBMOD_RESULT)
            if (NOT GIT_SUBMOD_RESULT EQUAL "0")
                message(FATAL_ERROR "Unable to update submodule \"${submodule_name}\"")
            endif ()
        endif ()
    endif ()

    if (NOT TARGET ${target_name} AND (EXISTS "${submodule_path}"))
        message(STATUS "Adding subdirectory \"${submodule_path}\"")
        add_subdirectory(${submodule_path})
    endif ()

endmacro()
