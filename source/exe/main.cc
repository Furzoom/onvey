// Onvey is an C++ L7 and communication bus.
//
// Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
// https://furzoom.com
// https://github.com/furzoom/onvey
//

#include "common/common/version_info.h"

int main() {
  fmt::print("version {}", VersionInfo::Version());
  return 0;
}

