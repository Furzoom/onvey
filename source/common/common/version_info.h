// Onvey is an C++ L7 and communication bus.
//
// Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
// https://furzoom.com
// https://github.com/furzoom/onvey
//

#pragma once

#include "precompiled/precompiled.h"

/**
 * Wraps compiled in code versioning.
 * NOTE: The kGitSha is generated into version_generated.cc and is not
 * present in the source tree.
 */

class VersionInfo {
 public:
  static std::string Version();

  static const std::string kGitSha;
};
