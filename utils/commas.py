import os
import sys

# TODO: remove last comma in the declarations. Almost done, but something went wrong


def get_file_lines(filename: str) -> list:
    """ Load the file as a list, line-by-line

    Args:
        filename (str): filename must include full path to the file

    Returns:
        list: line-by-line content
    """
    if not os.path.isfile(filename):
        print(f"File {filename} not found")
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

    print("No cypher file given of found")
    quit()


def add_commas(lines: list) -> list:
    """
    Checks for commas at the end of each line, that starts with a ( and ends with a )
    Also elliminates the comma at the end of last declaration, if such is present
    """
    new_lines = []
    added = 0
    for line in lines:
        if line.strip().startswith("(") and line.strip().endswith(")"):
            new_lines.append(line.strip("\n") + ",\n")
            added += 1
        else:
            new_lines.append(line)
    print(f"{added} missing commas added")
    return new_lines


def comparative_print(lines, new_lines: list):
    for a, b in zip(lines, new_lines):
        print("l", a)
        print("n", b)
        print()


def main():
    filename = argument(sys.argv)
    print(f"working with {filename}")
    lines = get_file_lines(filename)
    new_lines = add_commas(lines)
    if new_lines == lines:
        print("No changes neccesary")
    else:
        input("ENTER to implement changes to the file")
        save_file(filename, new_lines)
        # comparative_print(lines, new_lines)
    print("All done\n...buy")


if __name__ == "__main__":
    main()
