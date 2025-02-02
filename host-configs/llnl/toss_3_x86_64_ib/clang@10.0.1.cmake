# Copyright (c) 2017-2023, Lawrence Livermore National Security, LLC and
# other BLT Project Developers. See the top-level LICENSE file for details
# 
# SPDX-License-Identifier: (BSD-3-Clause)

#------------------------------------------------------------------------------
# Example host-config file for the ruby cluster at LLNL
#------------------------------------------------------------------------------
#
# This file provides CMake with paths / details for:
#  C,C++, & Fortran compilers + MPI
#------------------------------------------------------------------------------
# clang-10.0.1 compilers
# Uses gcc@8.3.1 standard library

set(CLANG_HOME "/usr/tce/packages/clang/clang-10.0.1")
set(GNU_HOME "/usr/tce/packages/gcc/gcc-8.3.1")

set(CMAKE_C_FLAGS "--gcc-toolchain=${GNU_HOME}" CACHE STRING "")

set(CMAKE_CXX_FLAGS "--gcc-toolchain=${GNU_HOME}" CACHE STRING "")

# c compiler
set(CMAKE_C_COMPILER "${CLANG_HOME}/bin/clang" CACHE PATH "")

# cpp compiler
set(CMAKE_CXX_COMPILER "${CLANG_HOME}/bin/clang++" CACHE PATH "")

# fortran support
set(ENABLE_FORTRAN ON CACHE BOOL "")

# fortran compiler
set(CMAKE_Fortran_COMPILER "${GNU_HOME}/bin/gfortran" CACHE PATH "")

#------------------------------------------------------------------------------
# Extra flags
#------------------------------------------------------------------------------

# Use clang's libc++ instead of libstdc++
set(BLT_CXX_FLAGS "-stdlib=libc++" CACHE STRING "")
set(gtest_defines "-DGTEST_HAS_CXXABI_H_=0" CACHE STRING "")

#------------------------------------------------------------------------------
# Static Analysis Support
#------------------------------------------------------------------------------
set(ClangQuery_DIR ${CLANG_HOME}/bin)
set(ENABLE_CLANGQUERY ON CACHE BOOL "")

set(ClangTidy_DIR ${CLANG_HOME}/bin)
set(ENABLE_CLANGTIDY ON CACHE BOOL "")

#------------------------------------------------------------------------------
# MPI Support
#------------------------------------------------------------------------------
set(ENABLE_MPI ON CACHE BOOL "")

set(MPI_HOME             "/usr/tce/packages/mvapich2/mvapich2-2.2-clang-10.0.1" CACHE PATH "")
set(MPI_C_COMPILER       "${MPI_HOME}/bin/mpicc"   CACHE PATH "")
set(MPI_CXX_COMPILER     "${MPI_HOME}/bin/mpicxx"  CACHE PATH "")
set(MPI_Fortran_COMPILER "${MPI_HOME}/bin/mpifort" CACHE PATH "")

set(MPIEXEC              "/usr/bin/srun" CACHE PATH "")
set(MPIEXEC_NUMPROC_FLAG "-n" CACHE PATH "")
