# Atheneum Boilerplate

This project serves as a template for consistent, cross-platform, open-source C++ library development.

One goal is to make it as simple as possible to go from cloning to a tested build with as few steps as possible. The
general process should be as simple as:

```
cmake .
cmake --build . --config Release
ctest -C Release
```

## Directory structure

- root
    - cmake
    - doc
    - examples
    - include
    - src
    - test
    - vendor

## Version control: Git

This setup relies on the projects being managed in a Git repository.

## Build system: CMake

Manages the overall build with specific scripts for handling:

- Defaulting build type (i.e., Release)
- [Uniform compiler flags](cmake/build-options-interface.cmake)
- Identifying build target architecture (i.e., operating system, compiler, and CPU instruction architecture) (TODO)
- Automatic versioning based on Git repository tags (TODO)
- Optional static or dynamic libraries
- Handling of MSVC and Windows specific requirements (e.g., MT/MD flags, export headers)

## Dependencies
### Git submodules

Where possible, dependencies are added using git submodules. In a few exceptional cases, a dependency may be vendored
directly in the root repository.

### Python / Poetry
Some supporting functionality, such as building viewer-friendly web-hostable documentation, is implemented with [Python](https://python.org) and its libraries. We are currently supporting Python 3.7 and higher.

This project uses the [Poetry](https://python-poetry.org/docs/#installation) python-package management tool. Python is used internally by the CMake build scripts; the CMake targets create a Poetry virtual environment in which the project's Python dependencies are installed, and in which commands are then run to build that target.

### Clang format
Use version 16+.

*Be aware the the Github workflow for checking clang-format may give different results than your desktop version.

### Documentation

C++ in-source documentation is written with [Doxygen](https://doxygen.nl) comments (see [guidelines](./doc/guidelines.md)). As many open-source projects host customizable sphinx-style help pages for viewer-friendly consumption, the Atheneum workflow also converts

## Error handling (TODO)

Consistent approach to handling error callbacks.

## Testing: CTest and Googletest

Unit tests are created by googletest and automatically detected by CTest and added to the test suite

## Formatting: Clang format

The simplest way to implement formatting using the .clang-format file is to integrate clang format support into your
IDE, which can be configured to automatically format code upon file-save. Else,

* On Windows, Visual Studio, set up clang format execution rules using *Tools > Options > Text Editor > C/C++ >
  Formatting*
* On Mac, `brew install clang-format` and run at the command line with `clang-format -i <file>`
* On Ubuntu, `sudo apt install clang-format` and run at the command line with `clang-format -i <file>`

## Code Coverage: Codecov

## CI: GitHub Actions

Automatic builds, testing, packaging, and deployment.

## Script Bindings (TODO)

## Documentation: Doxygen + ReadTheDocs(?) (TODO)

## Licensing: BSD-3

Be sure to use your own copyright for your projects using this structure.