#!/bin/bash

set -e

root_path="$(cd -- "$(dirname "$0")/.."; pwd)"

mkdir -p "$root_path/third-party/source"
cd "$root_path/third-party/source"
third_party_build="$root_path/third-party/build"

# fmtlib
if [[ ! -f "$third_party_build/lib/libfmt.a" ]]; then
  fmtlib_url="https://github.com/fmtlib/fmt/archive/refs/tags/12.1.0.tar.gz"
  wget -O fmtlib-12.1.0.tar.gz $fmtlib_url
  tar xf fmtlib-12.1.0.tar.gz
  cd fmt-12.1.0
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$third_party_build" .
  make install fmt
  cd ..
fi

# googletest
if [[ ! -f "$third_party_build/lib/libgtest.a" ]]; then
  googletest_url="https://github.com/google/googletest/releases/download/v1.17.0/googletest-1.17.0.tar.gz "
  wget -O googletest-1.17.0.tar.gz $googletest_url
  tar xf googletest-1.17.0.tar.gz
  cd googletest-1.17.0
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$third_party_build" .
  make install
  cd ..
fi

echo "OK"
