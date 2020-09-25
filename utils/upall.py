import os
import sys
from os import DirEntry
from os.path import isdir
from sys import argv


def dir_has_ext(path: str, ext: list) -> bool:
    """ checks if the directory contains files with any of the provided extensions """
    dir_exts = [
        os.path.splitext(filename)[1]
        for filename in os.listdir(path)
        if os.path.isfile(filename)
    ]
    print(path)
    return any([extension in dir_exts for extension in ext])


# working_dir = sys.argv[1] if len(sys.argv) > 1 else os.getcwd()
working_dir = "../cypher/"
# current_dir = os.getcwd()
print(os.listdir(working_dir))
dirs = [
    os.path.join(working_dir, directory)
    for directory in os.listdir(working_dir)
    if os.path.isdir(os.path.join(working_dir, directory))
]
print(dirs)
html_dirs = [directory for directory in dirs if dir_has_ext(directory, ".html")]
sh_dirs = [directory for directory in html_dirs if dir_has_ext(directory, ".sh")]
print(html_dirs)
print(sh_dirs)
