import os
import sys
from os import DirEntry
from os.path import isdir
from sys import argv
import pathlib


def dir_has_ext(path: str, ext: list) -> bool:
    """ checks if the directory contains files with any of the provided extensions """
    dir_exts = [
        os.path.splitext(filename)[1]
        for filename in os.listdir(path)
        if os.path.isfile(filename)
    ]
    # print(path)
    return any([extension in dir_exts for extension in ext])


def has_ext(dirname, ext: str) -> bool:
    for file in os.listdir(dirname):
        if file.endswith(ext):
            return True
    return False


# working_dir = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
working_dir = "../cypher/"
# current_dir = os.getcwd()
# print(os.listdir(working_dir))
dirs = [
    os.path.join(working_dir, directory)
    for directory in os.listdir(working_dir)
    if os.path.isdir(os.path.join(working_dir, directory))
]

mydir = os.getcwd()
for dir in dirs:
    path = pathlib.PurePath(dir)
    print(f"Directory {path.name}")
    if has_ext(dir, ".sh") and has_ext(dir, ".html"):
        print(f"bash and HTML files confirmed")
        os.chdir(dir)
        os.popen("s.sh")
        os.chdir(mydir)
