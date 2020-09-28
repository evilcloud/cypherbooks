// Intertextuality: origins and development of the concept
// by Maria Jesus Martines Alfaro
// title: María Jesús Martínez Alfaro -- Intertextuality: origins and development of the concept (1996)
// project: intertextuality

create
    (intertexuality:Term {name: "Intertextuality"}),
    (kristeva:Person {name: "Julia Kristeva"}),
    (worddialogue:Work {name: "Word, Dialogue and Novel", published: 1966, type: "paper"}),
    (boundedtext:Work {name: "The Bounded Text", pulished: 1967, type: "paper"}),
    (recherches:Work {name: "Recherches pour une sémanalyse", published: 1969, type: "paper"}),
    (bulgaria:Location {name: "Bulgaria", type: "country"}),
    (france:Location {name: "France"}),
    (bakhtin:Person {name: "Michkahil Bakhtin"}),
    (russia:Location {name: "Russia"}),
    (heteroglossia:Term {name: "Heteroglossia"}),
    (dialogism:Term {name: "Dialogism"}),
    (socrates:Person {name: "Socrates"}),




    (kristeva)-[:COINED]->(intertextuality),
    (kristeva)-[:WROTE]->(recherches),
    (recherches)-[:INCLUDES]->(boundedtext),
    (recherches)-[:INCLUDES]->(worddialogue),
    (bulgaria)<-[:FROM]-(kristeva),
    (france)<-[:LIVED]-(kristeva),
    (russia)<-[:FROM]-(bakhtin),
    (bakhtin)-[:COINED]->(heteroglossia),
    (bakhtin)-[:COINED]->(dialogism),
    (heteroglossia)-[:FOUND_IN]->(socrates),
    (dialogism)-[:FOUND_IN]->(socrates),
    

    ()
