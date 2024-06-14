include(initialize-submodules)

add_submodule(fmt)
if (NOT TARGET fmt)
    set(FMT_INSTALL OFF CACHE BOOL "" FORCE)
    mark_as_advanced(FMT_CMAKE_DIR FMT_CUDA_TEST FMT_DEBUG_POSTFIX FMT_DOC FMT_FUZZ FMT_INC_DIR FMT_INSTALL FMT_INSTALL
            FMT_LIB_DIR FMT_MODULE FMT_OS FMT_PEDANTIC FMT_PKGCONFIG_DIR FMT_SYSTEM_HEADERS FMT_TEST FMT_WERROR)
endif ()

# googletest library
if (${PROJECT_NAME}_BUILD_TESTING)
    add_submodule(googletest gtest)
endif ()
