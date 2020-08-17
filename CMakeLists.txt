################################################################################
project(Firmament)
################################################################################

cmake_minimum_required(VERSION 2.8)

include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
     message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()

# Path variable configuration
include(cmake/Paths.cmake)

# CMake helpers
include(CheckLibraryExists)
include(CheckFunctionExists)
include(ExternalProject)
include(CheckCXXSourceCompiles)


# Build options
include(Options)
# Compiler configuration
include(Config)
# Third-party dependencies and libraries
include(ExternalDependencies)
# Protocol buffer code generation
include(ProtobufCompile)

# Linting targets
include(LintTargets)

# Docker target (image build)
include(DockerTargets)

# Doxy documentaion target
include(DoxyTargets)

# Unit tests
if (BUILD_TESTS)
  enable_testing()
  set(GTEST_ROOT ${gtest_BINARY_DIR})
endif (BUILD_TESTS)

# Helper scripts that depend on protobufs
subdirs(scripts/job)
# The "src" subdir has all source code
subdirs(src)
