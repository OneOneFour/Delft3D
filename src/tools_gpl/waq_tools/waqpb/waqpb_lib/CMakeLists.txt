set(library_name waqpb_lib)

# Define include directory
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../include)

create_target(${library_name} ${CMAKE_CURRENT_SOURCE_DIR} src_dir .)

# Work around a gfortran ICE when compiling allocatable character arrays
set_source_files_properties(waqpb_base_settings.f90 PROPERTIES COMPILE_OPTIONS "-O0")

set(oss_dependencies deltares_common
                     nefis
                     waq_utils_f)

target_link_libraries(${library_name} ${oss_dependencies})

# Set additional compilation properties
target_compile_options(${library_name} PRIVATE ${waq_default_flags})
set_target_properties (${library_name} PROPERTIES FOLDER tools_gpl/waqpb)