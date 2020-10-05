// title: Philosophical Posthumanism (2020) Francesca Ferrando
// project: philposthumanism

create
// {part: 1} What is Philosophical Posthumanism?
    // {chapter: 1} Premises
    (posthumanism:Field {name: "Posthumanism"}),
    (postmodernism:Field {name: "Postmodernism"}),
    (humanism:Field {name: "Humanism"}),
    (antropoC:Subject {name: "antropocentrism"}),
    (dualism:Subject {name: "dualism"}),
    (andtopocene:Subject {name: "Antropocene"}),

    (posthumanism)-[:DEVELOPED_FROM]->(postmodernism),
    (antropocentrism)<-[:FOCUS_ON]-(humanism),

    // {chapter: 2} From Postmodern to Posthuman
    (criticalP:Field {name: "Critical Poshumanism"}),
    (culturalP:Field {name: "Cultural Poshumanism"}),
    (philoP:Field {name: "Philosophical Posthumanism"}),
    (hassan:Person {name: "Ihab Hassan"}),
    (prometheus:Work {name: "Prometheus as Performer: Toward a Posthumanist Culture?", type: "article", published: 1977}),
    (postTurn:Work {name: "The Postmodern Turn", type: "article", published: 1987}),
    (litCrit:Field {name: "Literary Criticism"}),
    (heyles:Person {name: "Katherine Hayles"}),
    (virtualBodies:Work {name: "How We Became Virtual Postuman: Virtual Bodies in Cybernetics, Literature and Informatics", type: "book", published: 1999}),
    (litTheory:Field {name: "Literary Theory"}),
    (cluturalStudies:Field {name: "Cultural Studies"}),
    (haraway:Person {name: "Donna Haraway"}),
    (maniCyborgs:Work {name: "A Manifesto for Cyborgs: Science, Technology, and Socialist Feminism in the 1980s", type: "article", published: 1985}),
    (animalStudies:Field {name: "Animal Studies"}),
    (transH:Field {name: "Transhumanism"}),
    (antiH:Field {name: "Antihumanism"}),
    (metaH:Field {hame: "Metahumanism"}),
    (posthumanities:Field {name: "Posthumanities"}),
    (metahumanities:Field {name: "Metahumanities"}),
    (ooo:Field {name: "Object-Oriented Ontologies"}),
    (nht:Field {name: "Non-human Turn"}),
    (feminism:Field {name: "Feminism"}),

    (criticalP)-[:PART_OF]->(posthumanism),
    (culturalP)-[:PART_OF]->(posthumanism),
    (philoP)-[:PART_OF]->(posthumanism),
    (antropocentrism)-[:REJECTED_BY]->(posthumanism),
    (prometheus)-[:CREATED_BY]->(hassan),
    (posthumanism)-[:COINED_BY]->(prometheus),
    (posthumanism)-[:COINED_BY]->(postTurn),
    (criticalP)-[:PART_OF]->(posthumanism),
    (criticalP)-[:DEVELOPED_FROM]->(litCrit),
    (virtualBodies)-[:CREATED_BY]->(heyles),
    (criticalP)-[:DEVELOPED_FROM]->(virtualBodies),
    (virtualBodies)-[:PART_OF]->(postmodernism),
    (virtualBodies)-[:PART_OF]->(feminism),
    (culturalP)-[:DEVELOPED_FROM]->(litCrit),
    (culturalP)-[:PART_OF]->(cluturalStudies),
    (maniCyborgs)-[:CREATED_BY]->(haraway),
    (culturalP)-[:DEVELOPED_FROM]->(maniCyborgs),
    (animalStudies)-[:DEVELOPED_FROM]->(maniCyborgs),

    // {chapter: 3} Posthumanism and Its Others
    (posthuman:State {name: "Can we be posthuman now?"}),

    (posthuman)-[:REJECTED_BY {reason: "attainable by tanscending beyon biological shell"}]->(transH),
    (posthuman)-[:ACCEPTED_BY {reason: "can shift away from antropocentric approach onto-epistiemology"}]->(posthumanism),

    // {chapter: 4} The Birth of Transhumanism
    (comedia:Work {name: "La Divina Comedia", published: 1321, type: "literature"}),
    (dante:Person {name: "Alghieri Dante", yob: 1265, yod: 1321}),
    (tseliot:Person {name: "T.S. Eliot", yob: 1888, yod: 1965}),
    (cocktailparty:Work {name: "The Cocktail Party", type: "literature", published: 1950}),
    (futureofmankind:Work {name: "The Future of Mankind", type: "anthology", published: 1959}),
    (essenceofdemocratic:Work {name: "The Essence of the Democratic Idea", fullName: "The Essence of the Democratic Idea: A Biological Approach", type: "paper", published: 1949}),
    (dechardin:Person {name: "Pierre Teilhard de Chardin", yob: 1881, yod: 1965}),
    (jHuxley:Person {name: "Julian Huxley", yob: 1887, yod: 1955}),
    (aHuxley:Person {name: "Aldous Huxley", yob: 1894, yod: 1963}),
    (phenoMan:Work {name: "The Phenomenon of Man", type: "book", published: 1955}),

    (comedia)-[:CREATED_BY]->(dante),
    (transH)-[:COINED_BY]->(comedia),
    (aHuxley)-[:SIBLING_OF {type: "brother"}]->(jHuxley),
    (transH)-[:COINED_BY]->(cocktailparty),
    (cocktailparty)-[:CREATED_BY]->(tseliot),
    (essenceofdemocratic)-[:PART_OF]->(futureofmankind),
    (futureofmankind)-[:CREATED_BY]->(dechardin),
    (transH)-[:COINED_BY]->(essenceofdemocratic),
    (futureofmankind)-[:CREATED_BY]->(dechardin),
    (phenoMan)-[:CREATED_BY]->(dechardin),
    (jHuxley)-[:PART_OF {type: "wrote introduction"}]->(phenoMan),
    (jHuxley)-[:FOCUS_ON]->(antropoC),
    
    // {chapter: 5} Contemporary Transhumanism
    (libertarianT:Field {name: "Libertarian Transhumanism"}),
    (demoT:Field {name: "Democratic Transhumanism"}),
    (extropianism:Field {name: "Extropianism"}),
    (singularitianism:Field {name: "Singualritianism"}),
    (hplus:Work {name: "H+", type: "media"}),
    (zIstvan:Person {name: "Zoltan Istvan"}),
    (presidency:Institution {name: "Presidency of USA"}),
    (jHughes:Person {name: "James Hughes"}),
    (maxMore:Person {name: "Max More"}),
    (extropyInst:Institution {name: "Extropy Institute", end: 2006}),
    (enlightment:Institution {name: "Enlightment", start: 1715, end: 1789}),
    (sandt:Institution {name: "Science & Technology"}),
    (philosophy:Field {name: "Philosophy"}),

    (libertarianT)-[:PART_OF]->(transH),
    (demoT)-[:PART_OF]->(transH),
    (extropianism)-[:PART_OF]->(transH),
    (singularitianism)-[:PART_OF]->(transH),
    (hplus)-[:CREATED_BY]->(transH),
    (zIstvan)-[:AFFILIATED_WITH]->(libertarianT),
    (zIstvan)-[:ATTEMPT_TO]->(presidency),
    (jHughes)-[:AFFILIATED_WITH]->(demoT),
    (extropianism)-[:CREATED_BY]->(maxMore),
    (maxMore)-[:AFFILIATED_WITH]->(extropianism),
    (extropianism)-[:FOCUS_ON]->(philosophy),
    (extropyInst)-[:PART_OF]->(extropianism),
    (posthumanism)-[:FOCUS_ON]->(enlightment),
    (posthumanism)-[:FOCUS_ON]->(sandt),

    // {chapter: 6} The Roots of Transhumanism
    (transDeclaration:Work {name: "Transhumanist Declaration", type: "manifest", published: 2002}),

    (transDeclaration)-[:CREATED_BY]->(jHughes),
    (transDeclaration)<-[:AFFIRMED_BY]-(enlightment),

    // {chapter: 7} Transhumanism and Techno-Enchantment
    (dPearce:Person {name: "David Pearce"}),
    (hedoImper:Field {name: "Hedonistic Imperative"}),
    (smartDrugs:Institution {name: "smart drugs"}),


    (hedoImper)-[:CREATED_BY]->(dPearce),
    (hedoImper)-[:FOCUS_ON]->(smartDrugs),
    (dPearce)-[:AFFILIATED_WITH]->(transH),
    



()
