# Utilities

This folder contains simple utilities, that suppose to make data entry and analysis simpler. The utilities are at different stages of development and are not guaranteed to function as advertised, expected, or at all.

Currently there are:

## CHAPTER_MARKER

scans a .cypher file provided in the argument for any dividers (marked by `// :` followed by the marker name and a marker value after a `:`, like `// :chapter: 1`) and checks the following entries (both nodes and edges) for presence of these markers. If no marker is present, the program adds it in the valid cypher format. Multiple markers possible, like:
    // :part: 1 
    // :chapter: 1 text text 
    // :chapter: 2 text text 
    // :part: 2 
    // :chapter: 1
... and so on...

the util is written in V, because I didn't want to bother with Go's array/slices drama and didn't want to let the Python mess out of my machine.
