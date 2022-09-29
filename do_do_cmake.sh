#!/bin/bash
rm -rf build
./do_cmake.sh -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_LIBDIR=/lib64
