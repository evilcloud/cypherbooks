# Graph YAML (draft 0.1)

This is not yet another markup language (pun intended), but an attempt to solve the issue of relatively simple manual data entry and storage without having to depend on databases running in the background, having to `SElECT` existing entries to modify them and the rest of the silliness, if you are not working with complex graphs and the only ACID you care about is the one, that dissolves on your tongue.

## What is it for?

The origin of the search for the simple format to store graphs was the idea to note some book content in the graph format -- characters, important objects, events, relations: a simple look at the graph not only will remind you of what the book was about, but often will reveal something not entirely obvious in the narrative process. Cypher was cool, but running Neo4j as a prerequisite for a book reading didn't make much sense. Besides, when things change or whenever a mistake is made, constantly running `match (n:Issue {name: "Mistake"}) detach delete n` is kind of dumb. The second attempt was to type the whole thing in a .cypher file in VSCode and then paste it into Neo4j. After about thousand forgotten commas have been added at the end of the lines, the result would be amazing, but by then the operator starts questioning his or her dignity. We are highly qualified and motivated media analysts, sitting here, adding commas at the end of each line that starts with an open bracket.

JSON sounded like a solution, and even the curly braces aren't the issue, but putting everything into apostrophes? Including the keys? And not having comments? No, thanks, YAML is kind of very obvious step from there.

Currently GYAML is used to store graph-based data of books and papers I am reading, as well as for some minor research. A quick typing in the good trusty VSCode or Atom with autoidentation and coloring, which comes with any YAML linter is a bliss. 


## How to gyaml?

GYAML deals with the classic graph triplets, like `subject-predicate->object` and has options for unlimited number of attributes both on `node` and `edge` levels.

Generally the entries look like this:

```yml
- alias: HomerSimpson
  label: Person
  relationship:
    - predicate: MARRIED_TO
      object: Marge
      attributes:
        role: husband
    - predicate: PARENT_OF
      - object: LisaSimpson
      - object: BartSimposon
      - object: MaggieSimpson
- alias: Marge
  label: Person
  name: Marge Simpson
  attributes:
    - sex: female
      maidenName: Bouvier
  relationship:
    - predicate: MARRIED_TO
      object: HomerSimpson
      attributes:
        - role: wife
          happily: true
    - predicate: PARENT_OF
      - object: LisaSimpson
      - object: BartSimposon
      - object: MaggieSimpson
- alias: LisaSimpson
  label: Person
  attributes:
    smart: true
    naughty: false
- alias: BartSimpson
  label: Person
  attributes:
    naughty: true
- alias: MaggieSimpson
  label: Person
```

as clearly seen in the example, unlike cypher, gyaml has the edge component already built in into the node. There isn't a reason not to do so for the manual entry -- the operator will always need to see the subject, whenever the new relationship appears anyway. There is also a possibility of entering the attributes as single entries or as the list. Not exactly a deal breaker in terms of efficiency, but some may feel annoyed by having to type an additional hyphen, so now they don't have to.

The important taxonomical parts are:
- **Node level**
  - **alias**: like any other alias it is necessary to declare further relationships with other nodes. Required even if not used
  - **label**: optional, but can be extremely useful in sorting the data by groups. Currently a single label supported. Multiple labels like `alias:label1:label2` is under consideration.
  - **name**: a value commonly used as a node name if present. [gyaml_parser]() automatically de-camelcases the alias and uses it as name if name entry is not present. Important: cypher keeps name attribute in attributes, while here it is kept in the node's main tree. The decision behind it is the speed of entry: the most simple data with a minimal number of scalars often will have a name, thus forcing to open attributes field. It is unnecessary so now.
  - **attributes**: optional, followed by the next line with the attribute(s)
    - any number and type of attributes are permitted
  - **relationships**: optional. The only way to declare edge. Subject is, of course is known and is unnecessary to add.
    - **object**: required. Declaration of the destination node. Can be a list.
    - **predicate**: required. Predicate. [gyaml_parser]() will uppercase and replace spaces with underscores.
    - **attributes**: optional
      - any number and type of attributes are permitted
    - *no other entries in this tree level will be registered*
  - *no other entries in this tree level will be registered*


## FAQ

1. Is there validation schema?
   
   It's coming. This is all I can tell on the topic right now.

2. Is there something that can parse GYAML into more orthodox formats?
   
   [gyaml_parser]() is a commandline utility (written in pure Python), which can parse gyaml into the following formats:
    - [cypher](https://www.opencypher.org/) : complete
    - [pyvis](https://pyvis.readthedocs.io/en/latest/) : complete
    - [networkX](https://networkx.github.io/) : in progress
    - [GraphML](http://graphml.graphdrawing.org/) : not started yet, but definitely on the backburner
  
    I am also planning to make a similar implementation in Golang. 
