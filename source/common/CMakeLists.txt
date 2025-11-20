# Onvey is an C++ L7 and communication bus.
#
# Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
# https://furzoom.com
# https://github.com/furzoom/onvey
#

SET(gen_git_sha_target ${CMAKE_CURRENT_BINARY_DIR}/version_generated.cc)
ADD_CUSTOM_TARGET(
    gen_git_sha ALL
    COMMAND  ${PROJECT_SOURCE_DIR}/tools/gen_git_sha.sh ${CMAKE_SOURCE_DIR} ${gen_git_sha_target}
)
ADD_CUSTOM_COMMAND(
    OUTPUT ${gen_git_sha_target}
    DEPENDS gen_git_sha
)

ADD_LIBRARY(onvey-common OBJECT
    common/version_info.cc
    ${gen_git_sha_target}
)

SET_TARGET_PROPERTIES(
        onvey-common PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT
        "../precompiled/precompiled.h"
)

cotire(onvey-common)
