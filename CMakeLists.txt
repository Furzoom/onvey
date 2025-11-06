# Onvey is an C++ L7 and communication bus.
#
# Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
# https://furzoom.com
# https://github.com/furzoom/onvey
#

CMAKE_MINIMUM_REQUIRED(VERSION 3.22)

PROJECT(Onvey CXX)

SET(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH};${PROJECT_SOURCE_DIR}/cmake")

INCLUDE(common)
INCLUDE(third-party)

# Setup build ID via the linker. Also, statically link GCC libraries to lock GCC version.
EXECUTE_PROCESS(COMMAND git rev-parse --sq HEAD OUTPUT_VARIABLE GIT_COMMIT WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    SET(CMAKE_EXE_LINKER_FLAGS "-Wl,--build-id=0x${GIT_COMMIT} -static-libstdc++ \
                                -static-libgcc ${ONVEY_EXTRA_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS}")
ELSE()
    SET(CMAKE_EXE_LINKER_FLAGS "${ONVEY_EXTRA_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS}")
ENDIF()

INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/include)
INCLUDE_DIRECTORIES(${PROJECT_BINARY_DIR}/source)
INCLUDE_DIRECTORIES(${PROJECT_SOURCE_DIR}/source)

ADD_SUBDIRECTORY(source)

SET(CLANG-FORMAT clang-format CACHE FILEPATH "path to clang-format binary")
SET(CHECK_FORMAT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/tools/check_format.py)
ADD_CUSTOM_TARGET(check_format
                  ${CHECK_FORMAT_PATH} ${CMAKE_SOURCE_DIR} ${CLANG-FORMAT} check)
ADD_CUSTOM_TARGET(fix_format
                  ${CHECK_FORMAT_PATH} ${CMAKE_SOURCE_DIR} ${CLANG-FORMAT} fix)
