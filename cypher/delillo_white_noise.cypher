create
// I - WAVES AND RADIATION 
// :part: 1
    // :chapter: 1
    (hill:Institution {name: "College-on-the-Hill", type: "education", part: 1, chapter: 1}),
    (protagonist:Person {name: "Jack Gladney", part: 1, chapter: 1}),
    (hitlerStudies:Subject {name: "Hitler Studies", type: "Academic discipline", since: 1968, part: 1, chapter: 1}),
    (hitlerDept:Institution {name: "department of Hitler Studies", type: "education", part: 1, chapter: 1}),
    (chancellor:Person {name: "chancellor of College-on-Hill", position: "leader", part: 1, chapter: 1}),
    (hitler:Person {name: "Adolf Hitler", position: "leader", part: 1, chapter: 1}),
    (nixon:Person {name: "Richard Nixon", position: "leader", part: 1, chapter: 1}),
    (ford:Person {name: "Gerard Ford", position: "leader", part: 1, chapter: 1}),
    (carter:Person {name: "Jimmy Carter", position: "leader", part: 1, chapter: 1}),
    (austria:Location {name: "Austria", type: "country", part: 1, chapter: 1}),
    // :chapter: 2
    (babette:Person {name: "Babette", part: 1, chapter: 2}),
    (volunteers:Institution {name: "volunteering group", type: "compassion", part: 1, chapter: 2}),
    (blind:Institution {name: "blind people", part: 1, chapter: 2}),
    (treadwell:Person {name: "Treadwell", nick: "Old Man Treadwell", part: 1, chapter: 2}),
    (natEnquirer:Media {name: "National Enquirer", type: "newspaper", part: 1, chapter: 2}),
    (natExaminer:Media {name: "National Examiner", type: "newspaper", part: 1, chapter: 2}),
    (natExpress:Media {name: "National Express", type: "newspaper", part: 1, chapter: 2}),
    (globe:Media {name: "Globe", type: "newspaper", part: 1, chapter: 2}),
    (world:Media {name: "World", type: "newspaper", part: 1, chapter: 2}),
    (star:Media {name: "Star", type: "newspaper", part: 1, chapter: 2}),
    (adEd:Institution {name: "adult education course", type: "education", part: 1, chapter: 2}),
    (stationwagon:Item {name: "station wagon", type: "car", color: "metalic grey", part: 1, chapter: 2}),
    (wilder:Person {name: "Wilder", child: true, part: 1, chapter: 2}),
    (home:Location {name: "Home", type: "dwelling", part: 1, chapter: 2}),
    (kitchen:Location {name: "kitchen", part: 1, chapter: 2}),
    (bedroom:Location {name: "bedroom", part: 1, chapter: 2}),
    (denise:Person {name: "Denise", child: true, age: 11, part: 1, chapter: 2}),
    (steffie:Person {name: "Steffie", child: true, part: 1, chapter: 2}),
    (heinrich:Person {name: "Heinrich", child: true, part: 1, chapter: 2}),
    // :chapter: 3
    (centuryHall:Location {name: "Century Hall", type: "building", part: 1, chapter: 3}),
    (cultDept:Institution {name: "culture deartment", fullName: "American environmets", type: "education", part: 1, chapter: 3}),
    (alfonse:Person {name: "Alfonse", fullName: "Alfonse (Fast Food) Stompanato", part: 1, chapter: 3}),
    (murray:Person {name: "Murray", fullName: "Murray Jay Siskind", part: 1, chapter: 3}),
    (roomingHouse:Location {name: "rooming house", type: "dwelling", part: 1, chapter: 3}),
    (womanWithSecret:Person {name: "a woman who harbors a terrible secret", part: 1, chapter: 3}),
    (hautedMan:Person {name: "a man with a hauted look", part: 1, chapter: 3}),
    (roomMan:Person {name: "a man who never comes out of his room", part: 1, chapter: 3}),
    (letterboxWoman:Person {name: "a woman who stnds by the letterbox for hours", part: 1, chapter: 3}),
    (noPastMan:Person {name: "a man with no past", part: 1, chapter: 3}),
    (blacksmith:Location {name: "Blacksmith", type: "settlement", part: 1, chapter: 3}),
    (asylum:Institution:Location {name: "Insane asylum", part: 1, chapter: 3}),
    (barn:Institution:Location {name: "tourist barn", fullName: "The most photographed barn in America", part: 1, chapter: 3}),
    (farmington:Location {name: "Farmington", type: "settlement", part: 1, chapter: 3}),



// I - WAVES AND RADIATION
// :part:1
    // :chapter: 1
    (hill)<-[:EMPLOYED_BY {chapter: 1}]-(protagonist),
    (hill)<-[:PART_OF {chapter: 1}]-(hitlerDept),
    (hitlerStudies)-[:SUBJECT_OF]->(hitlerDept),
    (hitlerStudies)-[:CREATED_BY]->(protagonist),
    (protagonist)-[:HEAD_OF]->(hitlerDept),
    (hill)<-[:HEAD_OF]-(chancellor),
    (chancellor)-[:ASSIST]->(nixon),
    (chancellor)-[:ASSIST]->(ford),
    (chancellor)-[:ASSIST]->(carter),
    (chancellor)-[:DIED_IN]->(austria),
    (chancellor)-[:ASSIST {type: ["course", "identity"]}]->(protagonist),
    // :chapter: 2
    (protagonist)-[:MARRIED_TO]->(babette),
    (volunteers)-[:ASSIST]->(blind),
    (babette)-[:MEMBER_OF]->(volunteers),
    (babette)-[:MEMBER_OF]->(adEd),
    (babette)-[:READ]->(treadwell),
    (treadwell)-[:MEMBER_OF]->(blind),
    (treadwell)-[:LIKES]->(natEnquirer),
    (treadwell)-[:LIKES]->(natExaminer),
    (treadwell)-[:LIKES]->(natExpress),
    (treadwell)-[:LIKES]->(globe),
    (treadwell)-[:LIKES]->(world),
    (treadwell)-[:LIKES]->(star),
    (protagonist)-[:OWNS]->(stationwagon),
    (babette)-[:OWNS]->(stationwagon),
    (babette)-[:MOTHER_OF]->(wilder),
    (wilder)-[:LIVES_IN]->(home),
    (babette)-[:LIVES_IN]->(home),
    (protagonist)-[:LIVES_IN]->(home),
    (home)<-[:MEMBER_OF]-(bedroom),
    (home)<-[:MEMBER_OF]-(kitchen),
    (denise)<-[:MOTHER_OF]-(babette),
    (denise)-[:LIVES_IN]->(home),
    (steffie)<-[:MOTHER_OF]-(babette),
    (steffie)-[:LIVES_IN]->(home),
    (heinrich)<-[:FATHER_OF]-(protagonist),
    (heinrich)-[:LIVES_IN]->(home),
    // :chapter: 3
    (cultDept)-[:LOCATED_IN]->(centuryHall),
    (hitlerDept)-[:LOCATED_IN]->(centuryHall),
    (alfonse)-[:HEAD_OF]->(cultDept),
    (murray)-[:MEMBER_OF {position: "visiting lecturer"}]->(cultDept),
    (murray)-[:LIVES_IN {role: "The Jew", permanent: false}]->(roomingHouse),
    (womanWithSecret)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (hautedMan)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (roomMan)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (letterboxWoman)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (noPastMan)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (home)-[:LOCATED_IN]->(blacksmith),
    (hill)-[:LOCATED_IN]->(blacksmith),
    (roomingHouse)-[:LOCATED_IN]->(blacksmith),
    (asylum)-[:LOCATED_IN]->(blacksmith),
    (barn)-[:LOCATED_IN]->(farmington),
    (protagonist)-[:TRAVEL_TO]->(barn),
    (murray)-[:TRAVEL_TO]->(barn)