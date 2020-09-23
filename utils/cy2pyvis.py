import sys
import os
import logging
import re
import itertools
import collections
from math import sqrt
from pyvis.network import Network


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
    return "[" in line


def get_var_from_node(line: str) -> str:
    body = line.split("(")[1]
    return clean_str(body.split(":")[0])


def get_var_from_edge(line: str):
    edge_vars = re.compile(r"\(\w*\)")
    var1, var2 = re.findall(edge_vars, line)
    return clean_str(var1), clean_str(var2)


def get_first_prop(line: str) -> str:
    _, body = line.split("{")
    props, _ = body.split("}")
    p = props.split(",")[0]
    return clean_str(p.split(":")[1])


def get_edge(line: str) -> str:
    _, body = line.split("[:")
    relation, _ = body.split("]")
    if " " in relation:
        relation = relation.split(" ")[0]
    return relation.lower().replace("_", " ")


def get_nodes_occurences(edges: list) -> dict:
    nodes_in_edges = list(itertools.chain.from_iterable(edges))
    return collections.Counter(nodes_in_edges)


def get_nodes_and_edges(lines: list):
    nodes = {}
    edges = []
    for line in lines:
        if is_node(line):
            nodes[get_var_from_node(line)] = get_first_prop(line)
        if is_edge(line):
            # print(get_var_from_edge(line))
            edges.append(get_var_from_edge(line))
    return nodes, edges


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
    save_file = "index.html"

    lines = get_lines(filename)
    print(f"loaded {len(lines)} lines")

    net = Network("95%", "100%")
    net.show_buttons()

    nodes, edges = get_nodes_and_edges(lines)
    node_weight = get_nodes_occurences(edges)
    print(f"collected {len(nodes)} nodes, {len(edges)} edges")

    for node in nodes:
        net.add_node(node, label=nodes[node], size=(sqrt(node_weight[node]) * 5))
    for var1, var2 in edges:
        net.add_edge(var1, var2)

    net.show(save_file)
    print(f"saved into {save_file}")


if __name__ == "__main__":
    main()
