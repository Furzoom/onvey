#!/usr/bin/env python

import os
import os.path
import sys

EXCLUDED_PREFIXES = ("./third-party", "./build", "./.git")
SUFFIXES = (".c", ".h")

if len(sys.argv) != 4:
    print("usage: check_format.py <directory|file> <clang_format_path> <check|fix>")
    sys.exit(1)

target_path = sys.argv[1]
clang_format_path = sys.argv[2]
operation_type = sys.argv[3]

found_error = False


def print_error(error):
    global found_error
    found_error = True
    print("ERROR: {}".format(error))


def check_format(file_path):
    if file_path.startswith(EXCLUDED_PREFIXES):
        return

    if not file_path.endswith(SUFFIXES):
        return

    if operation_type == "check":
        command = ("{} {} | diff -q {} - > /dev/null".format(clang_format_path, file_path, file_path))
        if os.system(command) != 0:
            print_error("clang-format check failed for file: {}".format(file_path))

    if operation_type == "fix":
        command = ("{} -i {}".format(clang_format_path, file_path))
        if os.system(command) != 0:
            print_error("clang-format rewrite error: {}".format(file_path))


def check_format_visitor(arg, dir_name, names):
    for file_name in names:
        check_format(dir_name + '/' + file_name)


if os.path.isfile(target_path):
    check_format("./" + target_path)
else:
    os.chdir(target_path)
    os.path.walk(".", check_format_visitor, None)

if found_error:
    print_error("ERROR: check format failed. run 'make fix_format'")
    sys.exit(1)
