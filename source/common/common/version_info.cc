// Onvey is an C++ L7 and communication bus.
//
// Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
// https://furzoom.com
// https://github.com/furzoom/onvey
//

#include "version_info.h"

std::string VersionInfo::Version() {
  return fmt::format("{}/{}", kGitSha.substr(0, 6),
#ifdef NDEBUG
                     "RELEASE"
#else
                     "DEBUG"
#endif
                     );
}
