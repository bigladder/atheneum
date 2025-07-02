cmake_minimum_required(VERSION 3.10)

find_program(CLANG_TIDY_EXE NAMES "clang-tidy")
#set(CLANG_TIDY_COMMAND "${CLANG_TIDY_EXE}" "-checks=-*,clang-analyzer-*,cppcoreguidelines-*, CheckOptions=[ {key: readability-identifier-naming.ClassCase, value: CamelCase} ]")
set(CLANG_TIDY_COMMAND "${CLANG_TIDY_EXE}")
message(STATUS ${CLANG_TIDY_COMMAND})

if (CLANG_TIDY_EXE STREQUAL CLANG_TIDY_EXE-NOTFOUND)
    # Derived from https://izzys.casa/2023/09/finding-msvc-with-cmake/
    cmake_path(
        CONVERT "$ENV{ProgramFiles\(x86\)}/Microsoft Visual Studio/Installer"
        TO_CMAKE_PATH_LIST vswhere.dir
        NORMALIZE)
    # This only temporarily affects the variable since we're inside a block.
    list(APPEND CMAKE_SYSTEM_PROGRAM_PATH "${vswhere.dir}")
    find_program(VSWHERE_EXECUTABLE NAMES vswhere DOC "Visual Studio Locator" REQUIRED)
    message(STATUS "Using vswhere executable: ${VSWHERE_EXECUTABLE}")

    set(MSVS_PRODUCT "BuildTools") # Common tool to search for
    set(product "Microsoft.VisualStudio.Product.${MSVS_PRODUCT}")
    message(CHECK_START "Searching for Visual Studio ${MSVS_PRODUCT}")
    execute_process(COMMAND "${VSWHERE_EXECUTABLE}" -nologo -nocolor
            -format json
            -products "${product}"
            -latest
            -utf8
            -find "**/clang-tidy.exe"
            -sort
        ENCODING UTF-8
        OUTPUT_VARIABLE candidates
        OUTPUT_STRIP_TRAILING_WHITESPACE)
    string(JSON candidates.length LENGTH "${candidates}")
    math(EXPR stop "${candidates.length} - 1")
    string(JSON CLANG_TIDY_EXE GET "${candidates}" ${stop})
    set(CLANG_TIDY_COMMAND "${CLANG_TIDY_EXE}")
    message(STATUS ${CLANG_TIDY_COMMAND})
endif()
