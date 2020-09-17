import sys
import os
import logging


def get_lines(filename: str) -> list:
    """ returns the content of the file as per provided filename line by line """
    if not os.path.splitext(filename)[1] in (".cypher", ".cyp"):
        print("Please prvide a valid cypher file")
        sys.exit()
    lines = []
    try:
        with open(filename, "r") as f:
            lines = f.readlines()
    except Exception as ex:
        logging.error(ex)
    return lines


def main():
    args = sys.argv
    lines = get_lines(args[1])
    print(f"Loaded file with {len(lines)} lines")
    marker_indicator = "// :"
    chapt_info = dict()
    for line in lines:
        c_line = line.strip()
        if c_line.startswith(marker_indicator) and c_line.count(":") > 1:
            marker, value = c_line[len(marker_indicator) :].rsplit(":")
            try:
                value = int(value)
            except ValueError:
                value = f'"{value.strip()}"'
            chapt_info[marker] = value
        print(chapt_info)


if __name__ == "__main__":
    main()
