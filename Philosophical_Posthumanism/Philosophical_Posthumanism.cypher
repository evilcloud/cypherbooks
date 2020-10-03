// title: Philosophical Posthumanism (2020) Francesca Ferrando
// project: philposthumanism

create
    // {chapter: 1} Premises
    (posthumanism:Field {name: "Posthumanism"}),
    (postmodernism:Field {name: "Postmodernism"}),
    (humanism:Field {name: "Humanism"}),
    (antropoC:Subject {name: "antropocentrism"}),
    (dualism:Subject {name: "dualism"}),
    (andtopocene:Subject {name: "Antropocene"}),

    (posthumanism)-[:DEVELOPED_FROM]->(postmodernism),
    (antropocentrism)-[:ACCEPTED_IN]->(humanism),

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
    

()
