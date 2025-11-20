# Onvey is an C++ L7 and communication bus.
#
# Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
# https://furzoom.com
# https://github.com/furzoom/onvey
#

INCLUDE_DIRECTORIES(${ONVEY_FMTLIB_INCLUDE_DIR})
INCLUDE_DIRECTORIES(${ONVEY_GOOGLETEST_INCLUDE_DIR})
INCLUDE_DIRECTORIES(${CMAKE_CURRENT_SOURCE_DIR})

ADD_EXECUTABLE(onvey-test
    $<TARGET_OBJECTS:onvey-common>
    common/common/version_info_test.cc
    main.cc
)

TARGET_LINK_LIBRARIES(onvey-test fmt)
TARGET_LINK_LIBRARIES(onvey-test gmock)
TARGET_LINK_LIBRARIES(onvey-test gtest)

SET_TARGET_PROPERTIES(onvey-test PROPERTIES COTIRE_CXX_PREFIX_HEADER_INIT
                      "precompiled/precompiled_test.h")
COTIRE(onvey-test)
