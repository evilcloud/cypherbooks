#!/usr/local/bin/python3

from os import name
from re import sub
import yaml
import os
import sys
import datetime
from parse_yaml import triplet


def argument(arg: list) -> str:
    """Checks for CLI arguments. 
    If a filename (with the path) is provided, then this information is used.
    If none is provided, then the currently active directory is searched for a single file with given extension(s).
    If none or multiple files with the extension are found, the program aborts.

    Args:
        arg (list): args

    Returns:
        str: filename
    """
    extension = ".yaml"
    if len(arg) > 1:
        return arg[1]

    ext_file = [
        filename for filename in os.listdir(".") if filename.endswith(extension)
    ]
    if len(ext_file) == 1:
        return ext_file[0]

    print(f"No {extension} file found in the directory")
    quit()


def save_file(filename, text: str):
    with open(filename, "w") as f:
        f.writelines(text)
        print(f"{filename} saved")


def load_yaml(filename: str) -> list:
    with open(filename, "r") as f:
        return yaml.load(f, Loader=yaml.FullLoader)


def alpha_num(data):
    try:
        # works both for lists and single items
        return [int(item) for item in data] if isinstance(data, list) else int(data)
    except ValueError:
        return f'"{data}"'


def build_attribute(data):
    attribute = ""
    attr_entry = data.get("attributes")
    if attr_entry:
        attribute = ", ".join(
            [f"{key}: {alpha_num(value)}" for key, value in attr_entry.items()]
        )
    return attribute


def build_node(data):
    attributes = ""
    attributes = build_attribute(data)
    name_entry = data["name"]
    name = ""
    if name_entry:
        name = f"name: {alpha_num(name_entry)}"
        attributes = name + ", " + attributes if attributes else name
    attributes = f" {{{attributes}}}" if attributes else ""
    return f'({data["alias"]}:{data["labels"]}{attributes})'


def build_edges(edge):
    subject = edge["subject"]
    obj = edge["object"]
    predicate = edge["predicate"].upper().replace(" ", "_")
    attributes = build_attribute(edge)
    attributes = f" {{{attributes}}}" if attributes else ""
    return f"({subject})-[:{predicate}{attributes}]->({obj})"


def build_cypher(filename):
    nodes, edges = triplet(filename)

    create = "CREATE\n"

    cypher_list = []
    for node in nodes:
        cypher_list.append(build_node(node))
    for edge in edges:
        cypher_list.append(build_edges(edge))

    header = """
// automatically generated cypher file
// from: {}
// nodes: {}
// edges: {}
// date: {}
    """.format(
        os.path.basename(filename),
        len(nodes),
        len(edges),
        datetime.datetime.now().replace(microsecond=0).isoformat(),
    )

    final = header + create + ",\n".join(cypher_list)
    new_filename = os.path.splitext(filename)[0] + ".cypher"
    save_file(new_filename, final)


def main():
    filename = argument(sys.argv)
    build_cypher(filename)


if __name__ == "__main__":
    main()
