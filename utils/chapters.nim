let fileContent = readFile("../cypher/delillo_white_noise.cypher")

# for line in fileContent.lines:
#     echo line


let content = array[]
let input = open("../cypher/delillo_white_noise.cypher")
for line in input.lines:
    content += line
