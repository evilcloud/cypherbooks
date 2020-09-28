// title: The Ramanyana by Maharishi Valmiki (attributed)
// project: ramanyana

// CHAPTER ONE — CHILDHOOD
create 
// Peritextual elements
    (valmiki:Sage {name: "Valmiki", fullName: "Maharishi Valmiki", sanskrit: "वाल्मीकि"}),
    (ramayana:Book {name: "Ramayana", sanskrit: "रामायणम्", type: "epic"}),
    (narada:Sage {name: "Narada", sanskrit: "नारद"}),
    (narada)<-[:TOLD_BY {topic: "Most virtuous person"}]-(valmiki),
    (ramayana)-[:CREATED_BY]->(valmiki),

// Narrative set-up
// Charachters
    (vishnu:God {name: "Vishnu", sanskrit: "विष्णु"}),
    (kubera:God {name: "Kubera", sanskrit: "कुबेर", responsibilities: "wealth"}),
    (rama:Character {name: "Rama", sanskrit: "राम", heir_ord: 1}),
    (kausalya:Character {name: "Kausalya"}),
    (dasharatha:Character {name: "Dasharatha", vocation: "king"}),
    (kaikeyi:Character {name: "Kaikeyi"}),
    (bharata:Character {name: "Bharata"}),
    (lakshmana:Character {name: "Lakshmana", sanskrit: "लक्ष्मण"}),
    (sumitra:Character {name: "Sumitra"}),
    (sita:Character {name: "Sita"}),
    (bharadvaja:Sage {name: "Bhardavaja"}),
    (viradha:Rakasa {name: "Viradha"}),
    (vasishta:Sage {name: "Vasishta"}),
    (agastya:Sage {name: "Agastya"}),
    (agastyaBrother:Character {name: "Agastya's brother"}),
    (surpanaka:Rakasa {name: "Surpanaka"}),
    (surpanakaVassals:Rakasa {name: "Surpanaka's vassal raksas"}),
    (khara:Rakasa {name: "Khara"}),
    (trisiras:Rakasa {name: "Trisiras"}),
    (dusana:Rakasa {name: "Dusana"}),
    (ravana:Rakasa {name: "Ravana"}),
    (marica:Rakasa {name: "Marica"}),
    (kabanda:Rakasa {name: "Kabanda"}),
    (jatayu:Beast {name: "Jatayu"}),
    (hanuman:Beast {name: "Hanuman"}),
    (khara)-[:IS]->(surpanakaVassals),
    (trisiras)-[:IS]->(surpanakaVassals),
    (dusana)-[:IS]->(surpanakaVassals),
    (ravana {name: "Ravana"}),
    (marica {name: "Marica"}),
    (jatayu {name: "Janayu", type: "monkey"}),
    (kabanda {name: "Kabanda"}),
    (hanuman {name: "Hanuman"}),

    
// Items
    (indrasWeapons:Item {name: "Indra's weapons"}),
    (bow:Item {name: "Indra's bow"}),
    (sword:Item {name: "Indra's sword"}),
    (arrow:Item {name: "Indra's arrow quivers", quantity: 2}),
    (bow)-[:PART_OF]->(indrasWeapons),
    (sword)-[:PART_OF]->(indrasWeapons),
    (arrow)-[:PART_OF]->(indrasWeapons),

// Locations and status
    (throne:Status {name: "Sovereignity"}),
    (exile:Status {name: "Exile"}),
    (ganga:Location {name: "Ganga", fullName: "Gagnes", type: "river"}),
    (citakutra:Location {name: "Citakutra", type: "village"}),
    (srngavera:Location {name: "Srngavera", type: "village"}),
    (dandaka:Location {name: "Dandaka", type: "forest"}),
    (jansthana:Location {name: "Jansthana"}),
    (pampa:Location {name: "Pampa", type: "lake"}),


// Relations
    (kausalya)-[:MOTHER_OF]->(rama),
    (kausalya)-[:MARRIED_TO {ord: 1}]->(dasharatha),
    (dasharatha)-[:FATHER_OF {ord: 1}]->(rama),
    (dasharatha)-[:AFFINITY_TO]->(rama),
    (kaikeyi)-[:MARRIED_TO {ord: 3}]->(dasharatha),
    (kaikeyi)-[:MOTHER_OF {ord: 1}]->(bharata),
    (dasharatha)-[:FATHER_OF {ord: 2}]->(bharata),
    (sumitra)-[:MARRIED_TO]->(dasharatha),
    (sumitra)-[:MOTHER_OF]->(lakshmana),
    (dasharatha)-[:FATHER_OF]->(lakshmana),
    (lakshmana)-[:AFFINITY_TO]->(rama),
    (sita)-[:MARRIED_TO]->(rama),

// Actions
// Travel and communication
    (sita)-[:FOLLOWING {subject: "Rama"}]->(exile),
    (lakshmana)-[:FOLLOWING {subject: "Rama"}]->(exile),
    (exile)-[:STOPPED_AT {reason: "dismissed charioteers and seen his father for the last time"}]->(srngavera),
    (bhardavaja)<-[:TOLD_BY {subject: "Rama"}]-(citakutra),
    (rama)-[:VISIT]->(agastya),
    (agastya)-[:OFFER]->(indrasWeapons)
    (indrasWeapons)<-[:TAKES]-(rama),
    (surpanaka)-[:INSTRUCTS]->(surpanakaVassals),
    (surpanakaVassals)-[:ARRIVE]->(jansthana),
    (ravana)-[:INSTRUCTS]->(marica),
    (jatayu)<-[:TOLD_BY {subject: "abduction details"}]-(rama),
    (rama)-[:RITE_FOR]->(jatayu),
    (rama)-[:RITE_FOR]->(kabanda),

// Militant
    (rama)-[:KILLED]->(viradha),
    (rama)-[:KILLED]->(surpanakaVassals),
    (rama)<-[:DISTRACTED_BY]-(marica),
    (ravana)-[:ABDUCTS]->(sita),
    (ravana)-[:KILLED]->(jatayu),
    (rama)-[:KILLED]->(kabanda),


// Abode
    (exile)-[:RESIDING_AT]->(citakutra),
    (citakutra)-[:RESIDING_AT {subject: "Rama moved for privacy"}]->(dandaka),
    (viradha)-[:RESIDING_AT]->(dandaka),
    (agastya)-[:RESIDING_AT]->(dandaka),
    (agastya)<-[:LIVES_WITH]-(agastyaBrother),
    (hanuman)-[:RESIDING_AT]->(pampa),

// Power transactions
    (dasharatha)<-[:POSESSED_BY]-(throne),
    (rama)-[:HEIR_TO {ord: 1}]->(throne),
    (rama)-[:IS_DENIED]->(throne),
    (bharata)-[:HEIR_TO {ord: 2}]->(throne),
    (vasishta)-[:OFFER {subject: "throne"}]->(bharata),
    (bharata)<-[:REJECTED_BY]-(throne),
    (bharata)-[:VISIT {subject: "Rama"}]->(citakutra),
    (rama)-[:URGES]->(bharata),
    (sandals:Item {name: "sandals"}),
    (rama)-[:GIVES]->(sandals),
    (bharata)<-[:ASCENDED_BY]-(throne),


// Characteristics
    (rama)-[:COMPARED_TO {trait: "valor"}]->(vishnu),
    (rama)-[:COMPARED_TO {trait: "truthseeking"}]->(kubera),
    (rama)-[:BANISHED_TO]->(exile),

// Undefined, perhaps unimportant? 
// Kept due to presence in text, but probably need to attach to all male heirs of the house
    (iksvaku:Clan {name: "Iskhvaku"}),
    (rama)-[:MEMBER_OF]->(iksvaku),
// Allusion
    (moon:HeavenlyBody {name: "Moon", type: "planet"}),
    (rohini:HeavenlyBody {name: "Rohini", type: "constellation"}),
    (rohini)-[:FOLLOWING]->(moon),
// Location
    (ganga)<-[:LOCATED_AT]-(srngavera)
