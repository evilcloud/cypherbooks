def is_comment(line: str) -> bool:
    return line.strip().startswith("//")


def is_node(line: str) -> bool:
    line = line.strip()
    return not is_comment(line) and not is_edge(line)


def is_other_command(line: str) -> bool:
    return not is_edge(line) and (
        line.lower().strip().startswith("create ") or line.strip().startswith("(")
    )


def is_edge(line: str) -> bool:
    return any((")-[" in line, "]-(" in line)) and any((")<-[" in line, "]->(" in line))


# def is_chain(line: str) -> bool:
#     return any((")-[" in line, "]-(" in line)) and any((")<-[" in line, "]->(" in line))


def split(line):
    return line.split("-")


def strip_all(data: str) -> str:
    data = data.strip()
    data = data.strip(")")
    data = data.strip("(")
    data = data.strip("]")
    data = data.strip("[")
    data = data.strip("'")
    data = data.strip('"')
    data = data.strip("}")
    data = data.strip()
    return data


def parse_node(data):
    data = strip_all(data)
    if "{" in data:
        main, attr = data.split("{")
        attr_list = attr.strip("}").split(",")
    else:
        main = data
        attr_list = []
    variable, *labels = main.split(":")
    labels = [label.strip() for label in labels]
    attributes = dict()
    for i in attr_list:
        if ":" in i:
            key, value = i.split(":")
            attributes[key] = strip_all(value)
    print(f"var: {variable}, lab: {labels}, att: {attributes}")
    input("parse node done")
    return variable, labels, attributes


def parse_edge(data):
    return data


def unchain(line: str):
    if not is_chain(line):
        return parse_node(line)
    split_line = split(line)
    ch_dict = {}
    while split_line:
        node1, edge, node2, *rest = split_line  # change to regex
        split_line = node2 + rest if rest else []
        if node1[-1] == "<":
            ch_dict["target"] = parse_node(node1)
            ch_dict["source"] = parse_node(node2)
        else:
            ch_dict["target"] = parse_node(node2)
            ch_dict["source"] = parse_node(node1)
        ch_dict["rel"] = parse_edge(edge)
    return ch_dict


filename = "../cypher/philosophical_posthumanism.cypher"
with open(filename, "r") as f:
    lines = f.readlines()

for line in lines:
    print("\n", line)
    if is_comment(line):
        print(f"Comment: {line}")
    # elif is_other_command:
    #     print(f"Inappropriate command: {line}")
    elif is_node(line):
        print("Node")
        variable, label, attribute = parse_node(line)
        print(f"V: {variable}\nL: {label}\nA: {attribute}")
    # elif is_edge(line):
    #     print("Edge")
    #     ch_dir = parse_edge(line)
    #     print(ch_dir)
    #     input()
    input()

print("done")
