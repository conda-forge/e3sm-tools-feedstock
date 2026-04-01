#!/usr/bin/env bash

set -x
set -e

cp -r ${RECIPE_DIR}/cmake ${RECIPE_DIR}/cmake_macros ${RECIPE_DIR}/tools ${RECIPE_DIR}/CMakeLists.txt .

rm -rf build
mkdir build
cd build
cmake \
  -D CMAKE_INSTALL_PREFIX="${PREFIX}" \
  -D NETCDF_PATH="${PREFIX}" \
  -D CMAKE_BUILD_TYPE=Release \
  ..
cmake --build .
cmake --install .
cd ..

# install Python scripts as executables for recipe tests/runtime use
install -m 755 tools/generate_domain_files/generate_domain_files_E3SM.py ${PREFIX}/bin
install -m 755 components/eam/tools/mkatmsrffile/mkatmsrffile.py ${PREFIX}/bin
