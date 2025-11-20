# Onvey is an C++ L7 and communication bus.
#
# Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
# https://furzoom.com
# https://github.com/furzoom/onvey
#

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ggdb3 -fno-omit-frame-pointer -Wall -Wextra -Werror")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wnon-virtual-dtor -Woverloaded-virtual -Wold-style-cast")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wconversion -Wpointer-arith -Wshadow -Wwrite-strings")

OPTION(ONVEY_CODE_COVERAGE "build with code coverage instrument" OFF)
IF(ONVEY_CODE_COVERAGE)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} --coverage")
    ADD_DEFINITIONS(-DCONVERAGE)
ENDIF()

OPTION(ONVEY_DEBUG "build debug binaries" ON)
IF(ONVEY_DEBUG)
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
    ADD_DEFINITIONS(-DDEBUG)
ELSE()
    SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2")
    ADD_DEFINITIONS(-DNDEBUG)
ENDIF()

OPTION(ONVEY_SANITIZE "build with address sanitizer?" OFF)
IF(ONVEY_SANITIZE)
    SET(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} " -fsanitize=address")
    SET(ONVEY_TCMALLOC OFF CACHE BOOL "" FORCE)
ENDIF()

OPTION(ONVEY_TCMALLOC "build with tcmalloc" ON)
IF(ONVEY_TCMALLOC)
    ADD_DEFINITIONS(-DTCMALLOC)
ENDIF()

SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

include(cotire)
