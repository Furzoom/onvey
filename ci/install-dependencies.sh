#!/bin/bash

set -e

root_path="$(cd -- "$(dirname "$0")/.."; pwd)"

mkdir -p "$root_path/third-party/source"
cd "$root_path/third-party/source"
third_party_build="$root_path/third-party/build"

# fmtlib
wget -O fmtlib-12.1.0.tar.gz https://github.com/fmtlib/fmt/archive/refs/tags/12.1.0.tar.gz
tar xf fmtlib-12.1.0.tar.gz
cd fmt-12.1.0
cmake -DCMAKE_INSTALL_PREFIX:PATH="$third_party_build" .
make install fmt
cd ..
