#!/usr/bin/python3

import sys
import os
import logging
import re
import itertools
import collections
from math import sqrt
from subprocess import Popen
from pyvis.network import Network
from pyvis.node import Node
from pyvis.physics import Physics


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


def is_node(line: str) -> bool:
    node = re.compile(r"\s?\w*?\s?\(\w*?:\w*\s?\{?.*")
    return True if re.search(node, line) else False


def is_edge(line: str) -> bool:
    return "[:" in line


def get_var_from_node(line: str) -> str:
    body = line.split("(")[1]
    return clean_str(body.split(":")[0])


def get_label_from_node(line: str) -> list:
    body = line.split("(")[1]
    if " " in body:
        labels = body.split(" ")[0]
    else:
        labels = body.split(")")[0]
    return labels.split(":")[1:]


def get_var_from_edge(line: str):
    try:
        edge_vars = re.compile(r"\(\w*\)")
        var1, var2 = re.findall(edge_vars, line)
        return clean_str(var1), clean_str(var2)
    except Exception as ex:
        print(line)
        print(ex)
        input()


def get_first_prop(line: str) -> str:
    try:
        _, body = line.split("{")
        props, _ = body.split("}")
        p = props.split(",")[0]
        return clean_str(p.split(":")[1])
    except Exception:
        return None


def get_edge(line: str) -> str:
    _, body = line.split("[:")
    relation, _ = body.split("]")
    if " " in relation:
        relation = relation.split(" ")[0]
    return relation.lower().replace("_", " ")


def get_nodes_occurences(edges: list) -> dict:
    edges_pairs = [pair[0] for pair in edges]
    pairs = list(itertools.chain.from_iterable(edges_pairs))
    return collections.Counter(pairs)


def get_nodes_and_edges(lines: list):
    nodes = {}
    edges = []
    labels = {}
    for line in lines:
        if is_node(line):
            var = get_var_from_node(line)
            name = get_first_prop(line)
            nodes[var] = name if name else var
            labels[var] = get_label_from_node(line)
        if is_edge(line):
            edges.append((get_var_from_edge(line), get_edge(line)))
    return nodes, edges, labels


def get_title(line: str) -> str:
    if line.startswith(title_marker):
        return line[len(title_marker) :]
    return None


def scan_lines(lines: list, marker: str) -> str:
    for line in lines:
        if line.startswith(marker):
            return line[len(marker) + 1 :]
    return ""


def get_metadata(lines: list):
    title = scan_lines(lines, "// title:")
    project = scan_lines(lines, "// project:")
    return title.strip(), project.strip()


def clean_str(string: str):
    return (
        string.replace("'", "")
        .replace('"', "")
        .replace(")", "")
        .replace("(", "")
        .strip()
    )


def main():
    args = sys.argv
    if len(args) > 1:
        filename = args[1]
    else:
        filename = "../cypher/delillo_white_noise.cypher"

    lines = get_lines(filename)
    print(f"loaded {len(lines)} lines")

    header, project = get_metadata(lines)

    net = Network("95%", "100%", heading=header)
    net.show_buttons()

    nodes, edges, labels = get_nodes_and_edges(lines)
    node_weight = get_nodes_occurences(edges)
    print(f"collected {len(nodes)} nodes, {len(edges)} edges, {len(labels)} labels")

    # shapes = {
    #     "Person": "triangle",
    #     "Institution": "star",
    #     "Everything else": "dot",
    # }
    # net.add_node("LEGEND", shape="circle")
    # for shape_key in shapes:
    #     net.add_node(shape_key, shape=shapes[shape_key])
    #     net.add_edge("LEGEND", shape_key)

    label_set = set()
    for node in nodes:
        first_label = labels[node][0]
        label_set.add(first_label)
        # shape = shapes.get(first_label, "dot")
        group = first_label if first_label else ""
        net.add_node(
            node, label=nodes[node], group=group, size=(sqrt(node_weight[node]) * 5),
        )
    for vars, title in edges:
        var1, var2 = vars
        net.add_nodes([var1, var2])
        net.add_edge(var1, var2, title=title)

    net.add_node("LEGEND", shape="circle", physics=False)
    for label in label_set:
        net.add_node(label, group=label)
        net.add_edge("LEGEND", label, hidden=True)

    load_dir = os.path.split(filename)[0]
    save_file = "index.html"
    if project:
        save_dir = project
    else:
        base = os.path.basename(filename)
        pure = os.path.splitext(base)[0]
        save_file = pure + ".html"
        save_dir = "no_project_metadata"

    save_dir = os.path.join(load_dir, save_dir)
    if not os.path.exists(save_dir):
        os.mkdir(save_dir)

    net.show(os.path.join(save_dir, save_file))
    print(f"saved into {save_file} in {save_dir}")
    bash_line = f"surge . --domain {project}.surge.sh\nrm index.html"
    bash_file = os.path.join(save_dir, "s.sh")
    with open(bash_file, "w") as f:
        f.write(bash_line)
    os.chmod(bash_file, 509)


if __name__ == "__main__":
    main()
