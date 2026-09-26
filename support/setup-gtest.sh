#!/bin/sh
set -e

# Build GoogleTest from the sources shipped by the libgtest-dev package.
# The CMake build is in-source, so the archives are produced next to the
# sources (there is no `lib/` subdirectory). Install them into /usr/lib
# where the linker looks.
cd /usr/src/gtest
cmake CMakeLists.txt
make
cp ./*.a /usr/lib/

# Refresh the symlinks idempotently; previously they were left dangling.
ln -sf /usr/lib/libgtest.a /usr/local/lib/libgtest.a
ln -sf /usr/lib/libgtest_main.a /usr/local/lib/libgtest_main.a
