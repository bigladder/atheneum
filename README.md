# Atheneum Boilerplate

This project serves as a template for consistent, cross-platform, open-source C++ library development.

One goal is to make it as simple as possible to go from cloning to a tested build with as few steps as possible. The general process should be as simple as:

```
cmake .
cmake --build . --config Release
ctest -C Release
```

## Directory structure

- root
    - cmake
    - docs
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
- Uniform compiler flags (TODO)
- Identifying build target architecture (i.e., operating system, compiler, and CPU instruction architecture) (TODO)
- Automatic versioning based on Git repository tags (TODO)
- Optional static or dynamic libraries
- Handling of MSVC and Windows specific requirements (e.g., MT/MD flags, export headers) (TODO)

## Dependencies: Git submodules

Where possible, dependencies are added using git submodules. In a few exceptional cases, a dependency may be vendored directly in the root repository.

## Error handling (TODO)

Consistent approach to handling error callbacks.

## Testing: CTest and Googletest

Unit tests are created by googletest and automatically detected by CTest and added to the test suite

## Formatting: Clang format (TODO)

## Code Coverage: Codecov (TODO)

## CI: Travis-CI (TODO)

Automatic builds, testing, packaging, and deployment.

## Script Bindings (TODO)

## Documentation: Doxygen + ReadTheDocs(?) (TODO)

## Licensing: BSD-3

Be sure to use your own copyright for your projects using this structure.