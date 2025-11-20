#!/bin/bash

mkdir -p build/debug
cmake -B build/debug
cmake --build build/debug
