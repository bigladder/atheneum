# C++ Conventions and Formatting Guidelines

This document is intended to summarize Big Ladder's approach to styling new C++ code, to maintain internal consistency between our original works. 

For details of best practices in code craftsmanship, refer to the CPP Core Guidelines, actively maintained by the luminaries behind the C++ standard: [https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main](https://isocpp.github.io/CppCoreGuidelines/CppCoreGuidelines#main).


# Naming 


## File names

File names should be lowercase.

Interface (header) files should use the suffix “.h”.

Implementation (code) files should use the suffix “.cpp”.

Use hyphens (“-”) to separate words in file names.


## Includes

Use angle brackets &lt;> for external headers and quotes “” for internal headers.


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

In order to avoid naming conflicts between preprocessor directives and compiled code, symbols should always be all uppercase.

## Function names

Functions (free, friend, static, member functions, etc.) should begin with a lower-case letter, using underscores to separate words. 

* Functions in private class scope may begin a designated abbreviation for the class followed by an underscore


## Typedefs


## Comments


# Formatting

In the absence of a standard formatting tool, use the following clang-format guidelines to organize your code.

Prefer spaces to tab characters when indenting (set your text editor to replace tabs).

The following clang-format list supports all (CPP-related) tags available in Clang 17, as listed in [https://clang.llvm.org/docs/ClangFormatStyleOptions.html](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)

