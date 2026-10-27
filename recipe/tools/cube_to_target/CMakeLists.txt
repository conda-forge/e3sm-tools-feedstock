SET(SRC ${CMAKE_SOURCE_DIR}/components/eam/tools/topo_tool/cube_to_target)
set(CUBE_TO_TARGET_SRC ${SRC}/cube_to_target.F90
                       ${SRC}/orographic_shape_methods.F90
                       ${SRC}/reconstruct.F90
                       ${SRC}/remap.F90
                       ${SRC}/shr_kind_mod.F90)

include_directories(${netcdf_f_incdir})
add_executable(cube_to_target ${CUBE_TO_TARGET_SRC})
target_link_libraries(cube_to_target ${netcdf_f_libs})

install(TARGETS cube_to_target DESTINATION bin)
