#!/usr/local/bin/python3

import sys
import yaml
import os
import re
import itertools


def camel_case_split(string: str) -> str:
    """Returns the string split by capital letters: CamelCase -> Camel Case

    Args:
        string (str): camelcased string

    Returns:
        str: split string
    """
    return " ".join(re.findall(r"[A-Z](?:[a-z]+|[A-Z]*(?=[A-Z]|$))", string))


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


def get_yaml(filename: str) -> list:
    with open(filename, "r") as f:
        return yaml.load(f, Loader=yaml.FullLoader)


def alpha_num(data):
    try:
        return int(data)
    except ValueError:
        try:
            return float(data)
        except:
            pass
    return data


def extract_node(data):
    # input(data)
    schematics = {"node": "_node", "label": "_label", "name": "name"}
    node = data[schematics["node"]]
    label = data.get(schematics["label"])
    name = data.get(schematics["name"])
    name = name if name else camel_case_split(node)
    attributes = ""
    for items in data:
        if items not in schematics:
            attributes += f', {items}: "{data[items]}"'
    return f'{node}:{label} {{name: "{name}"{attributes}}}'


def unpack_arguments(data):
    arguments = []
    for item in data:
        if item in ["object", "predicate"]:
            continue
        arguments.append(f'{item}: "{data[item]}"')
    return ", ".join(arguments)


def build_edges(data):
    ret = []
    edges = data.get("edge")
    if not edges:
        return
    subject = data["_node"]
    if type(edges) == list:
        for edge in edges:
            predicate = edge["predicate"]
            object = edge["object"]
            ret.append(
                f"({subject})-[:{predicate} {{{unpack_arguments(edge)}}}]->({object})"
            )
    else:
        predicate = edges["predicate"]
        object = edges["object"]
        ret.append(
            f"({subject})-[:{predicate} {{{unpack_arguments(edges)}}}]->({object})"
        )
    return ret


data = get_yaml(argument(sys.argv))
nodes = []
edges = []
for item in data:
    nodes.append(extract_node(item))
    edges.append(build_edges(item))

for node in nodes:
    print(node, "\n")
    pass
for edge in edges:
    # print(edge)
    pass
