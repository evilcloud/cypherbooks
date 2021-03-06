// The History of ‘Transhumanism’
// Authors: Peter Harrison, Joseph Wolnyak
// doi: 10.1093/notesj/gjv080
// url: https://academic.oup.com/nq/article/62/3/465/1141551
// title: The History of ‘Transhumanism’ (2015) by Peter Harrison, Joseph Wolnyak
// {date: 2015}
// project: history_of_transhumanism
create 
    (jHuxley:Person {name: "Julian Huxley", byear: 1887, dyear: 1975}),
    (eugenics:Field {name: "Eugenics"}),
    (eBiology:Field {name: "Evolutionary Biology"}),
    (philosophy:Field {name: "Philosophy"}),
    (jurispridence:Field {name: "Jurispridence"}),
    (history:Field {name: "History"}),
    (biology:Field {name: "Biology"}),
    (bible:Work {name: "The Bible"}),
    (transhumanism:Field {name: "Transhumanism"}),
    (tPaper:Work {name: '"Transhumanism"', published: 1957}),
    (newBottles:Work {name: "New Bottles for New Wine", type: "lecture", published: 1951}),
    (dante:Person {name: "Alighieri Dante", byear: 1265, dyear: 1321}),
    (laComedia:Work {name: "La Comedia", type: "literature"}),
    (purgatorio:Work {name: "Purgatorio", type: "chapter"}),
    (inferno:Work {name: "Inferno", type: "chapter"}),
    (paradiso:Work {name: "Paradiso", type: "chapter"}),
    (lighhall:Person {name: "W.D. Lighhall", from: "Canada"}),
    (proceedings:Work {name: "Proceedings and Transactions", published: 1940}),
    (hfcarey:Person {name: "Henry Francis Carey"}),
    (translation:Field {name: "Translation"}),
    (divComedy:Work {name: "Divine Comedy", published: 1814}),
    (biology)<-[:MEMBER_OF]-(jHuxley),
    (proceedings)-[:REFERENCES]->(bible),
    (laComedia)-[:REFERENCES]->(bible),
    (divComedy)-[:CREATED_BY]->(hfcarey),
    (proceedings)<-[:COINED_BY]-(transhumanism),
    (transhumanism)-[:COINED_BY]->(newBottles),
    (divComedy)-[:ORIGINATED_FROM]->(laComedia),
    (purgatorio)-[:MEMBER_OF]->(divComedy),
    (inferno)-[:MEMBER_OF]->(divComedy),
    (transhumanism)-[:COINED_BY]->(paradiso),
    (laComedia)-[:CREATED_BY]->(dante),
    (hfcarey)-[:MEMBER_OF]->(translation),
    (lighhall)-[:MEMBER_OF]->(philosophy),
    (lighhall)-[:MEMBER_OF]->(jurispridence),
    (lighhall)-[:MEMBER_OF]->(history),
    (proceedings)<-[:COINED_BY]-(transhumanism),
    (newBottles)-[:CREATED_BY]->(jHuxley),
    (transhumanism)-[:COINED_BY]->(paradiso),
    (paradiso)-[:MEMBER_OF]->(divComedy),
    (transhumanism)-[:COINED_BY]->(tPaper),
    (proceedings)-[:CREATED_BY]->(lighhall),
    (jHuxley)-[:MEMBER_OF]->(eugenics),
    (jHuxley)-[:MEMBER_OF]->(eBiology),
    (tPaper)-[:CREATED_BY]->(jHuxley)

    //
