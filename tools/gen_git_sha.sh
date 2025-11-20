#!/bin/bash

# gen_git_sha.sh <root path> <output file>
SHA=$(git -C $1 rev-parse HEAD)
grep -q $SHA $2
if [[ $? -ne 0 ]]; then
  echo -e "#include \"common/common/version_info.h\"\n\n" > $2
  echo -e "const std::string VersionInfo::kGitSha(\"$SHA\");\n" >> $2
fi
