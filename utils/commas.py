#! /usr/bin/python3

import os
import sys
import re

# TODO: Make the real last comma declaration, not the fake ()
# TODO: Check the presense of edge directions
# TODO:


class color:
    PURPLE = "\033[95m"
    CYAN = "\033[96m"
    DARKCYAN = "\033[36m"
    BLUE = "\033[94m"
    GREEN = "\033[92m"
    YELLOW = "\033[93m"
    RED = "\033[91m"
    BOLD = "\033[1m"
    UNDERLINE = "\033[4m"
    END = "\033[0m"


def get_file_lines(filename: str) -> list:
    """ Load the file as a list, line-by-line

    Args:
        filename (str): filename must include full path to the file

    Returns:
        list: line-by-line content
    """
    if not os.path.isfile(filename):
        print(color.RED + f"File {filename} not found" + color.END)
        quit()
    with open(filename, "r") as f:
        return f.readlines()


def save_file(filename: str, lines: list):
    """Saves file

    Args:
        filename (str): filename must include the full path
        lines (list): line-by-line content
    """
    with open(filename, "w") as f:
        f.writelines(lines)
    print("file saved")


def argument(arg: list) -> str:
    """Checks for CLI arguments. If a filename (with the path) is provided,
    then this information is used.
    If none is provided, then the currently active directory is searched for 
    a single '.cypher' file.
    If none or multiple '.cypher' files are found, the program aborts.

    Args:
        arg (list): args

    Returns:
        str: filename
    """
    if len(arg) > 1:
        return arg[1]

    cypher = [filename for filename in os.listdir(".") if filename.endswith(".cypher")]
    if len(cypher) == 1:
        return cypher[0]

    print(color.RED + "No cypher file given of found" + color.END)
    quit()


def add_commas(line: str) -> str:
    if line.strip().startswith("("):
        if line.strip().endswith(")"):
            return line.strip("\n") + ",\n"
        if ") #" in line:
            part1, part2 = line.rsplit(")")
            return part1 + ")," + part2
    return None


def exception(line) -> bool:
    return line.strip() == "()"


def check_lines(lines: list) -> list:
    added = 0
    new_lines = []
    for i, line in enumerate(lines):
        if exception(line) or i == len(lines):
            continue
        with_commas = add_commas(line)
        if line := with_commas:
            lines[i] = line
            print(f"{color.BLUE + str(i+1) + color.END}", line.strip("\n"))
            added += 1

    print(f"\nCommas added: {color.BOLD + str(added) + color.END}")
    return lines if added else None


def main():
    filename = argument(sys.argv)
    # filename = (
    #     "/Users/kg/Documents/code/cypherbooks/utils/Philosophical_posthumanism.cypher"
    # )
    print(f"Checking {color.BOLD + filename + color.END}")
    lines = get_file_lines(filename)
    new_lines = check_lines(lines)
    if new_lines:
        input("ENTER to implement changes to the file")
        save_file(filename, new_lines)
    else:
        print(color.BLUE + "No changes needed" + color.END)
    print("All done\n...bye")


if __name__ == "__main__":
    main()
