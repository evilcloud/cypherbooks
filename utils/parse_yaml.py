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
        # works both for lists and single items
        return [int(item) for item in data] if isinstance(data, list) else int(data)
    except ValueError:
        return data


def extract_attributes(attributes, ignorelist) -> dict:
    attrib = {}
    if attributes:
        for attribute in attributes:
            if attribute in ignorelist:
                continue
            attrib[attribute] = alpha_num(attributes[attribute])
    return attrib


def extract_node(data) -> dict:
    node = {}
    node["alias"] = data["alias"]
    node["labels"] = data["label"]
    name = data.get("name")
    node["name"] = name if name else camel_case_split(node["alias"])
    attr = extract_attributes(data.get("attributes"), ["relationship"])
    if attr:
        node["attributes"] = attr
    return node


def extract_edges(data) -> list:
    """Returns a list of dictionaries with extracted 'relationship' subdictionaries.
    Attributes, if present, are inclused as an internal dictionary

    Args:
        data (dict): a JSON style dictionary with necessary 'object' and 'predicate'. Optional 'attributes'

    Returns:
        (list): a dictionary with full enumerated data (attributes, if present, an interanl dictionary)
    """
    subject = data["alias"]
    relation = {}
    ret = []
    edges = []
    edge_data = data.get("relationship")
    if not edge_data:
        return ret
    if isinstance(edge_data, dict):
        edges.append(edge_data)
    else:
        edges = edge_data
    for edge in edges:
        relation = {}
        relation["subject"] = subject
        relation["object"] = edge["object"]
        relation["predicate"] = edge["predicate"]
        attr = extract_attributes(edge.get("attributes"), ["object", "predicate"])
        if attr:
            relation["attributes"] = attr
        ret.append(relation)
    return list(ret)


def triplet(filename):
    nodes = []
    edges = []
    data = get_yaml(filename)
    # run though the entries
    for entry in data:

        # get the nodes
        nodes.append(extract_node(entry))

        # get the edges
        for edge_list in extract_edges(entry):
            edges.append(edge_list)
    return nodes, edges


def main():
    filename = argument(sys.argv)
    nodes, edges = triplet(filename)

    for node in nodes:
        print(node)
    print("---")
    for edge in edges:
        print(edge)


if __name__ == "__main__":
    main()
