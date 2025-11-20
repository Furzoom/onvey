# Onvey is an C++ L7 and communication bus.
#
# Copyright (c) 2025, Niz <mn@furzoom.com>, Furzoom.com
# https://furzoom.com
# https://github.com/furzoom/onvey
#

ADD_EXECUTABLE(onvey main.cc $<TARGET_OBJECTS:onvey-common>)

cotire(onvey)
