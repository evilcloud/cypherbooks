import sys
import os
import logging
import re


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


def make_marker_string(data: dict) -> str:
    string = ""
    for key in data:
        string += f"{key}: {data[key]}, "
    return string[:-2]


def check_marker(line: str) -> dict:
    properties_dict = dict()
    try:
        head, body_tail = line.split("{", 1)
        body, tail = body_tail.split("}", 1)
        properties = body.split(",")
        for prop in properties:
            try:
                key, value = prop.split(":")
                properties_dict[key] = value.strip()
            except Exception as ex:
                print(line)
                print(f'Something went wrong with the internal format: {ex}')
                print(prop)
                input('Press ENTER to continue or Ctrl+C to cancel the operation')
    except ValueError: # entry does not contain properties
        pass
    return properties_dict


# def re_mark(lines):
#     marker_indicator = "// :"
#     template_markers = dict()
#     for line in lines:
#         line_stripped = line.strip()
#         if line.strip().startswith(marker_indicator) and line.count(":") > 1:
#             marker, value = line.strip()[len(marker_indicator):].split(":", 1)
#             try:
#                 value = int(value)
#             except ValueError:
#                 value = f'"{value.strip()}"'
#             template_markers[marker] = value
#         else:
#             print(check_marker(line))
#
#         # print(f"[{make_marker_string(chapt_info)}]")

def re_mark(lines):
    marker_indicator = re.compile(r'\/\/ {(.*)}') # look up for // {chapter: 1} type of info
    running_markers = dict()
    for line in lines:
        found_markers = re.findall(marker_indicator, line)
        if found_markers and found_markers[0].count(":") > 0:
        # running marker found
            for marker in "".join(found_markers).split(','):
                key, value = marker.split(':', 1)
                running_markers[key] = value.strip()
        else:
        # must be an ordinary line, could be a node or edge
            properties_dict = dict()
            try:
                head, body_tail = line.split("{", 1)
                body, tail = body_tail.split("}", 1)
                properties = body.split(",")
                for prop in properties:
                    try:
                        key, value = prop.split(":")
                        properties_dict[key] = value.strip()
                    except Exception as ex:
                        print('Something is messed up. Better Ctrl-C to cancel. ENTER will let you continue')
                        print(ex)
                        print(line)
                        input("make the right choice")
                for marker in running_markers:
                    properties_dict[marker] = running_markers[marker]
                    print(properties_dict)
            except Exception as ex:
                pass

def main():
    args = sys.argv
    lines = get_lines(args[1])
    print(f"Loaded file with {len(lines)} lines")
    re_mark(lines)

if __name__ == "__main__":
    main()
