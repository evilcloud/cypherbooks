import logging
import os
import re
import sys


def get_lines(filename: str) -> list:
    """ returns the content of the file as per provided filename line by line """
    lines = []
    if not os.path.splitext(filename)[1] in (".cypher", ".cyp"):
        print("Please provide a valid cypher file")
        sys.exit()
    try:
        with open(filename, "r") as f:
            lines = f.readlines()
    except Exception as ex:
        logging.error(ex)
    return lines


def save_lines(filename: str, lines: list) -> str:
    head, tail = os.path.split(filename)
    new_filename = os.path.join(head, "NEW_" + tail)
    with open(new_filename, "w") as f:
        f.writelines(lines)
    return new_filename


def properties_to_string(data: dict) -> str:
    """ returns a valid cypher argument string with provided markers """
    string = ""
    for key in data:
        string += f"{key}: {data[key]}, "
    return "{" + string[:-2] + "}"


def format_argument(value: str):
    """ returns properly formatted (int, bool, str) cypher argument """
    try:
        return int(value)
    except ValueError:
        value = value.strip().strip("'").strip('"')
        if value in ("true", "True", "false", "False"):
            return value
        return f'"{value}"'


def is_chapter(line: str) -> bool:
    marker = re.compile(r"\/\/ {(.*)}")  # look up for // {chapter: 1} type of info
    return True if re.search(marker, line) else False

def is_node(line: str) -> bool:
    node = re.compile(r"^\s*?\((([[:alnum:]]*)?:[[:alnum:]]+)+(\s+{.*})?\)\s?(,|#.*)$")
    return True if re.search(node, line) else False


def is_edge(line: str) -> bool:
    edge = re.compile(r"[^\s*]?\(.*\)<?-\[.*\].+\(.*\),?[\s#*]?$")
    return True if re.search(edge, line) else False


def is_element(line: str) -> bool:
    """ checks wether the line is an element or not """
    # loose_node = re.compile(r"\s*\(.*")
    return is_node(line) or is_edge(line)


def extract_markers(line: str) -> tuple:
    args_dict = {}
    try:
        head, body = line.split("{")
        arguments, tail = body.split("}")
        for argument in arguments.split(","):
            try:
                arg_key, arg_val = argument.split(":")
                arg_key = arg_key.strip()
                args_dict[arg_key] = format_argument(arg_val)
            except Exception as ex:
                print("something serious went down")
                print(ex)
                print(line)
                print(argument)
                input()
        return head, args_dict, tail
    # no {arguments}, not even curly brackets
    except Exception:
        return None


def line_by_line(lines: list) -> list:
    """ returns the same cypher, but with chapter properties inserted at the end of each element"""
    new_lines = []  # the main variable to be returned
    chapter_markers = {}  # dict for running parts, chapters etc.
    for line in lines:  # the main loop

        # detect parts, chapters
        if is_chapter(line):
            _, chapter_args, _ = extract_markers(line)
            for chapter_arg in chapter_args:
                chapter_markers[chapter_arg] = chapter_args[chapter_arg]
            new_lines.append(
                line
            )  # the original line is still necessary to retain original form

        # detect nodes or edges
        elif is_element(line):
            ex_markers = extract_markers(line)
            if ex_markers:
                head, arguments, tail = ex_markers
                for marker in chapter_markers:
                    arguments[marker] = chapter_markers[marker]
                if arguments:
                    new_lines.append(f"{head}{properties_to_string(arguments)}{tail}")
            else:
                if chapter_markers:
                    if is_edge:
                        head, tail = line.split("]")
                        new_lines.append(
                            f"{head} {properties_to_string(chapter_markers)}]{tail}"
                        )
                    elif is_node:
                        head, tail = line.split(")")
                        new_lines.append(
                            f"{head} {properties_to_string(chapter_markers)}){tail}"
                        )
        else:
            new_lines.append(line)
    return new_lines


def main():
    args = sys.argv
    if len(args) > 1:
        filename = args[1]
    else:
        print("launching default setting")
        filename = "../cypher/delillo_white_noise.cypher"
    print(f"file: {filename}")
    lines = get_lines(filename)
    print(f"Loaded file with {len(lines)} lines")
    new_lines = line_by_line(lines)

    new_filename = save_lines(filename, new_lines)
    print(f"Saved {len(new_lines)}")
    new_path, new_base = os.path.split(new_filename)
    print(f"to file {new_base} in the folder {new_path}")


if __name__ == "__main__":
    main()
