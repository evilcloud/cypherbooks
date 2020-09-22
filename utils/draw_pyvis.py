import sys
import os
import logging
import re
from pyvis.network import Network

net = Network("95%", "100%")
net.show_buttons()


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


def get_variable(line: str) -> str:
    body = line.split("(")[1]
    return body.split(":")[0]


def get_var_from_edge(line: str):
    line = line.replace("<", "").replace(">", "").replace("(", "").replace(")", "")
    parts = line.split("-")
    return clean_str(parts[0]), clean_str(parts[2])


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


def clean_str(string: str):
    return string.strip().replace("'", "").replace('"', "")


lines = get_lines("../cypher/delillo_white_noise.cypher")
print(f"loaded {len(lines)} lines")
nodes = {}
edges = {}
rel = []
i = 0
for line in lines:
    if is_node(line):
        nodes[get_variable(line)] = get_first_prop(line)
        # net.add_node(get_variable(line))

for line in lines:
    if is_edge(line):
        # relationship = get_edge(line)
        first_node, second_node = get_var_from_edge(line)
        net.add_node(first_node, label=nodes[first_node])
        net.add_node(second_node)
        net.add_edge(first_node, second_node)

net.show("pv.html")
