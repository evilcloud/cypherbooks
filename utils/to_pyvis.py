#!/usr/local/bin/python3

import collections
from os import name
from os.path import getmtime
from re import sub
import yaml
import os
import sys
import collections
from math import sqrt
from parse_yaml import triplet
from pyvis.network import Network


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


def save_yaml(filename, text: str):
    with open(filename, "w") as f:
        f.writelines(text)
        print(f"{filename} saved")


def load_yaml(filename: str) -> list:
    with open(filename, "r") as f:
        return yaml.load(f, Loader=yaml.FullLoader)


def count_node_weight(edges):
    collect = []
    for edge in edges:
        collect.append(edge["object"])
    return collections.Counter(collect)


def get_lines(filename, delimiter):
    with open(filename, "r") as f:
        for line in f.readlines():
            if ret := line.strip().startswith(delimiter):
                return ret
        return ""


def metadata_header(filename):
    header = get_lines(filename, "// title:")
    return (
        header
        if header
        else os.path.splitext(os.path.basename(filename))[0].replace("_", " ")
    )


def build_pyvis(filename):
    header = metadata_header(filename)
    net = Network("95%", "100%", heading=header)
    net.show_buttons()
    nodes, edges = triplet(filename)
    node_weight = count_node_weight(edges)
    for node in nodes:
        group = node["labels"] if node["labels"] else ""
        net.add_node(
            node["alias"],
            label=node["name"],
            group=group,
            size=((sqrt(node_weight[node["alias"]]) + 1) * 5),
        )
    for edge in edges:
        net.add_node(edge["subject"], color="blue")
        net.add_node(edge["object"], color="blue")
        net.add_edge(edge["subject"], edge["object"], title=edge["predicate"])

    net.barnes_hut(
        gravity=-4000,
        central_gravity=0.3,
        spring_strength=0.001,
        damping=0.09,
        overlap=1,
    )
    net.show("index.html")


def main():
    filename = argument(sys.argv)
    build_pyvis(filename)


if __name__ == "__main__":
    main()
