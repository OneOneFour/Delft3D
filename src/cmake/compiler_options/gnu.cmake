# Set Intel compiler specific flags:
enable_language (Fortran)
set(src_root_dir ${CMAKE_SOURCE_DIR}/..)

if (WIN32)
    message(FATAL_ERROR "GNU compilers are not supported on Windows. CMake will exit.")
endif(WIN32)

if (UNIX)
    # Set optional flags:
    message(STATUS "Setting Fortran compiler flags in Unix")

    set(CMAKE_CXX_FLAGS_RELEASE      "-O3 -march=native -fPIC -fopenmp")
    set(CMAKE_C_FLAGS_RELEASE        "-O3 -march=native -fPIC -fopenmp")
    set(CMAKE_Fortran_FLAGS          "-O3 -march=native -funroll-loops -g -fbacktrace -fPIC -fopenmp -ffixed-line-length-132 -ffree-line-length-none -fallow-argument-mismatch -D__linux__")
    set(CMAKE_CXX_FLAGS_DEBUG        "-g -O0 -fPIC -fopenmp")
    set(CMAKE_C_FLAGS_DEBUG          "-g -O0 -fPIC -fopenmp")
    
    set(cpp_compiler_flags           "-std=c++17")
    set(dialect                      "-std=f2008")
    set(bounds                       "-fbounds-check")
    set(openmp_flag                  "-fopenmp")

    set(file_preprocessor_flag       "-cpp")
    set(traceback_flag               "-fbacktrace")

    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif(UNIX)

set(waq_default_flags ${file_preprocessor_flag} ${traceback_flag})
