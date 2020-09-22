import strutils
import strformat
import re



let fileContent = readFile("../cypher/delillo_white_noise.cypher")
let fileLines = splitLines(fileContent)
echo fmt"...loaded {fileLines.len} strings"

for line in fileLines:
    if line.find(re"\/\/ {\.*}"):
        echo line