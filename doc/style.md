# C++ Conventions and Formatting Guidelines

This document is intended to summarize Big Ladder's approach to styling new C++ code, to maintain internal consistency between our original works.

Note: This guide should not supersede the style used in third-party code bases - when contributing to an established project, always use the existing styles.

For details of best practices in code craftsmanship, refer to the CPP Core Guidelines, actively maintained by the luminaries behind the C++ standard: [https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main).


# Naming


## File names

1. File names should be lowercase.

1. Interface (header) files should use the suffix “.h”.

1. Implementation (code) files should use the suffix “.cpp”.

1. Use hyphens (“-”) to separate words in file names.


## Includes

Use angle brackets &lt;> for external headers and quotes "" for internal headers.

Example:

    #include <fmt.h>
    #include "my_class_impl.h"

## Namespace names

Namespaces should begin with a lower-case letter, using underscores to separate words.

Example:

    namespace bigladder {}


## Class names / Struct tags

Begin each word of the name with a capital letter.

* If an acronym is used inside the class name, capitalize the letters of the acronym, as required, to convey meaning.

Examples:

```
MyDataStruct

MyPCIeClass (vs. MyPcieClass)

NRELSolarDecathalon (vs. NrelSolarDecathalon)
```

## Variable names

Variable names should begin with a lower-case letter, using underscores to separate words.

* Use descriptive variables names in preference to single letters (primarily for function or class scope). Abbreviations should be avoided. Code should be as self-documenting as possible.
* Avoid coding the variable type into its name (as in “Hungarian” notation)

Local variables:

    int local_variable;

Variables of classes should not use any prefix or suffix to denote type, scope, or constness.

Append  `_in` to argument variable names to explicitly prevent shadowing of arguments with names similar to member variable names.


## Enumeration names

If an enumeration has a tag or enum class name, it follows the same convention as classes: begin with a capital letter and then capitalize any words within the name. The individual enumerants should be lower-case, underscore-separated.

Examples:

	enum class VacuumPump { ion, turbo, diffusion };

## Preprocessor symbols

In order to avoid naming conflicts between preprocessor directives and compiled code, symbols and macros should always be all uppercase.

Example:

    #define ABOUT_PI 3

## Function names

Functions (free, friend, static, member functions, etc.) should begin with a lower-case letter, using underscores to separate words.

Example:

    void member_function(int placeholder);

## Typedefs


## Comments

Use comments to *clarify intent* or *document unintiuitive behavior*.

Use Doxygen-style comments that can be used to auto-generate class or library documentation. These should be in the header for public functions.

Examples:
```
/// @class Atheneum atheneum.h
/// @brief Interface for the Atheneum library

class Atheneum {
    ...
};
```

```
  // --------------------------------------------------------------------
  /// @brief	Add a table of data from which interpolated results
                will be calculated.
  /// @param	value_vector Vector of length equal to the product
                of dimension sizes.
  /// @return	Index in @c value_tables of the table just added
  // --------------------------------------------------------------------
  std::size_t add_value_table(std::vector<double> &value_vector);
```

# Formatting

In the absence of a standard formatting tool, use the following clang-format guidelines to organize your code.

Prefer spaces to tab characters when indenting (set your text editor to replace tabs).

The following clang-format list supports all (CPP-related) tags available in Clang 17, as listed in [https://clang.llvm.org/docs/ClangFormatStyleOptions.html](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)

## Editor settings

1. Install clang-format 16+ in your path.

    * **VSCode:** Optionally, you can change the setting `"c_cpp:clang_format_path"` to point to your system clang-format (if it's not in the system path). Otherwise,

        >If not specified, and clang-format is available in the environment path, that is used. If not found in the environment path, the clang-format bundled with the [cpptools] extension will be used.

        (On Mac, it's located in `~/.vscode/extensions/ms-vscode.cpptools-1.17.5-darwin-x64/LLVM/bin/clang-format`)

1. Set format-on-save (or on type, if preferred)

    * **VSCode:** Set `"editor.formatOnSave"` to format when you save your file, or `"editor.formatOnType"` to format as you type (triggered on the ; character).

1. Trim trailing white space (not supported by clang-format; must be set in the IDE)
    * **VSCode:** Set `"files.trimTrailingWhitespace"` : true

1. Add extra line at the end of the file. (This is supported by clang-format 16 and higher with directive `InsertNewlineAtEOF: true`.)

1. Line ending settings (Supported by clang-format directive `LineEnding: DeriveLF`.)
