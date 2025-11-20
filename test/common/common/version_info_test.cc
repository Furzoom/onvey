// Onvey is an C++ L7 and communication bus.
//
// Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
// https://furzoom.com
// https://github.com/furzoom/onvey
//

#include "common/common/version_info.h"

#include "precompiled/precompiled_test.h"

TEST(VersionInfo, Version) {
  EXPECT_FALSE(VersionInfo::kGitSha.empty());
  EXPECT_EQ(8u, VersionInfo::Version().find("/"));
}