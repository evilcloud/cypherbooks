import sys
import os
import logging
import re


def get_lines(filename: str) -> list:
    """ returns the content of the file as per provided filename line by line """
    if not os.path.splitext(filename)[1] in (".cypher", ".cyp"):
        print("Please provide a valid cypher file")
        sys.exit()
    lines = []
    try:
        with open(filename, "r") as f:
            lines = f.readlines()
    except Exception as ex:
        logging.error(ex)
    return lines


def make_marker_string(data: dict) -> str:
    string = ""
    for key in data:
        string += f"{key}: {data[key]}, "
    return string[:-2]


# def check_marker(line: str) -> dict:
#     properties_dict = dict()
#     try:
#         head, body_tail = line.split("{", 1)
#         body, tail = body_tail.split("}", 1)
#         properties = body.split(",")
#         for prop in properties:
#             try:
#                 key, value = prop.split(":")
#                 properties_dict[key] = value.strip()
#             except Exception as ex:
#                 print(line)
#                 print(f"Something went wrong with the internal format: {ex}")
#                 print(prop)
#                 input("Press ENTER to continue or Ctrl+C to cancel the operation")
#     except ValueError:  # entry does not contain properties
#         pass
#     return properties_dict


# def re_mark(lines):
#     marker_indicator = re.compile(
#         r"\/\/ {(.*)}"
#     )  # look up for // {chapter: 1} type of info
#     running_markers = dict()
#     for line in lines:
#         found_markers = re.findall(marker_indicator, line)
#         if found_markers and found_markers[0].count(":") > 0:
#             # running marker found
#             for marker in "".join(found_markers).split(","):
#                 key, value = marker.split(":", 1)
#                 running_markers[key] = value.strip()
#         else:
#             # must be an ordinary line, could be a node or edge
#             properties_dict = dict()
#             try:
#                 head, body_tail = line.split("{", 1)
#                 body, tail = body_tail.split("}", 1)
#                 properties = body.split(",")
#                 for prop in properties:
#                     try:
#                         key, value = prop.split(":")
#                         properties_dict[key] = value.strip()
#                     except Exception as ex:
#                         print(
#                             "Something is messed up. Better Ctrl-C to cancel. ENTER will let you continue"
#                         )
#                         print(ex)
#                         print(line)
#                         input("make the right choice")
#                 for marker in running_markers:
#                     properties_dict[marker] = running_markers[marker]
#                     print(properties_dict)
#             except Exception as ex:
#                 pass


def digit_or_string(value: str):
    try:
        return int(value)
    except ValueError:
        return value.strip()


# def chapter_marker(line: str) -> tuple:
#     marker = re.compile(r"\/\/ {(.*)}")  # look up for // {chapter: 1} type of info
#     delimiter = ":"
#     found = re.findall(marker, line)
#     found = found[0] if found else None
#     if not found or delimiter not in line:
#         return None  # No valid chapter marker found
#     key, val = found.split(delimiter)
#     value = digit_or_string(val)
#     return (key, value)


def is_chapter(line: str) -> bool:
    marker = re.compile(r"\/\/ {(.*)}")  # look up for // {chapter: 1} type of info
    if re.search(marker, line):
        return True
    return False


def is_element(line: str) -> bool:
    # node = re.compile(r"\s*\(.*\)($|\s|\s#.*)")
    # edge = re.compile(r"\s*\(.*\)(-|<-)(\[.*])(-|->)\(.*\)($|\s|\s#.*)")
    loose_node = re.compile(r"\s*\(.*")
    if re.search(loose_node, line):  # or re.search(edge, line):
        return True
    return False


def extract_markers(line: str) -> tuple:
    args_dict = {}
    try:
        head, body = line.split("{")
        arguments, tail = body.split("}")
        for argument in arguments.split(","):
            try:
                arg_key, arg_val = argument.split(":")
                args_dict[arg_key] = digit_or_string(arg_val)
            except Exception as ex:
                print("something serious went down")
                print(ex)
                print(line)
                input()
        return (head, args_dict, tail)
    except Exception as ex:
        print("no arguments")
        print(line)
        input()


def line_by_line(lines: list) -> list:
    # ch_marker = {}
    for line in lines:

        # # chapter markers
        # chapter = chapter_marker(line)
        # chapter_markers = {}
        # if chapter:
        #     key, value = chapter
        #     chapter_markers[key] = value

        # chapter markers
        if is_chapter(line):
            print(extract_markers(line))
        # element markers
        if is_element(line):
            extract_markers(line)


def main():
    args = sys.argv
    if len(args) > 1:
        filename = args[1]
    else:
        print("launching default setting")
        filename = ["", "../cypher/delillo_white_noise.cypher"]
    lines = get_lines(filename)
    print(f"Loaded file with {len(lines)} lines")
    line_by_line(lines)


if __name__ == "__main__":
    main()
