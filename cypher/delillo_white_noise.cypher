create
// NODES
// I - WAVES AND RADIATION 
// {part: 1}
    // {chapter: 1}
    (hill:Institution {name: "College-on-the-Hill", type: "education", part: 1, chapter: 1}),
    (protagonist:Person {name: "Jack Gladney", age: 51, part: 1, chapter: 1}),
    (hitlerStudies:Subject {name: "Hitler Studies", type: "Academic discipline", since: 1968, part: 1, chapter: 1}),
    (hitlerDept:Institution {name: "department of Hitler Studies", type: "education", part: 1, chapter: 1}),
    (chancellor:Person {name: "chancellor of College-on-Hill", position: "leader", part: 1, chapter: 1}),
    (hitler:Person {name: "Adolf Hitler", position: "leader", part: 1, chapter: 1}),
    (nixon:Person {name: "Richard Nixon", position: "leader", part: 1, chapter: 1}),
    (ford:Person {name: "Gerard Ford", position: "leader", part: 1, chapter: 1}),
    (carter:Person {name: "Jimmy Carter", position: "leader", part: 1, chapter: 1}),
    (austria:Location {name: "Austria", type: "country", part: 1, chapter: 1}),
    // {chapter: 2}
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
    (heinrich:Person {name: "Heinrich", child: true, age: 14, part: 1, chapter: 2}),
    // {chapter: 3}
    (centuryHall:Location {name: "Century Hall", type: "building", part: 1, chapter: 3}),
    (cultDept:Institution {name: "culture deartment", fullName: "American environmets", type: "education", part: 1, chapter: 3}),
    (alfonse:Person {name: "Alfonse", fullName: "Alfonse (Fast Food) Stompanato", part: 1, chapter: 3}),
    (murray:Person {name: "Murray", fullName: "Murray Jay Siskind", part: 1, chapter: 3}),
    (roomingHouse:Location {name: "rooming house", type: "dwelling", part: 1, chapter: 3}),
    (womanWithSecret:Person {name: "a woman who harbors a terrible secret", part: 1, chapter: 3}),
    (hautedMan:Person {name: "a man with a hauted look", part: 1, chapter: 3}),
    (dunlop:Person {name: "Howard Dunlop", nickName: "a man who never comes out of his room", part: 1, chapter: 3}),
    (letterboxWoman:Person {name: "a woman who stnds by the letterbox for hours", part: 1, chapter: 3}),
    (noPastMan:Person {name: "a man with no past", part: 1, chapter: 3}),
    (blacksmith:Location {name: "Blacksmith", type: "settlement", part: 1, chapter: 3}),
    (asylum:Institution:Location {name: "Insane asylum", part: 1, chapter: 3}),
    (barn:Institution:Location {name: "tourist barn", fullName: "The most photographed barn in America", part: 1, chapter: 3}),
    (farmington:Location {name: "Farmington", type: "settlement", part: 1, chapter: 3}),
    // {chapter: 4}
    (bee:Person {name: "Bee", child: true, age: 12}),
    (tweedy:Person {name: "Tweedy Browner"}),
    (korea:Location {name: "South Korea", type: "country"}),
    (eroticFic:Item {name: "erotic fiction"}),
    // {chapter: 5}
    // {chapter: 6}
    (devi:Person {name: "Mother Devi", fullName: "Janet Savory"}),
    (ashram:Location {name: "ashram", fullName: "Dharamsalapur", type: "community"}),
    (tubb:Location {name: "Tubb MT", type: "settlement"}),
    (artsDuplex:Location {name: "Arts Duplex", type: "building"}),
    (advNazism:Subject {name: "Advanced Nazism", type: "academic discipline"}),
    // {chapter: 7}
    (church:Location:Institution {name: "Congregational church"}),
    // {chapter: 8}
    (german:Language:Subject {name: "German"}),
    // {chapter: 9}
    (chun:Person {name: "Chun Duc", child: true}),
    // {chapter: 10}
    (tommyRoy:Person {name: "Tommy Roy Foster", position: "criminal"}),
    (prison:Institution {name: "prison"}),
    (ironCity:Location {name: "Iron City", type: "settlement"}),
    // {chapter: 11}
    (cia:Institution {name: "CIA"}),
    (dana:Person {name: "Dana Breedlove", age: babette.age}),
    (spanish:Language {name: "Spanish"}),
    (portugese:Language {name: "Portugese"}),
    (eugene:Person {name: "Eugene", child: true, age: 8}),
    (babetteEx:Person {name: "Babette's ex"}),
    (australia:Location {name: "Australia", type: "country"}),
    // {chapter: 12}
    (greek:Language:Subject {name: "Greek"}),
    (latin:Language:Subject {name: "Latin"}),
    (sailing:Subject {name: "Ocean sailing"}),
    (meteorology:Subject {name: "Meteorology"}),
    (bob:Person {name: "Bob Pardee"}),
    (treadwellSister:Person {name: "Mr. Treadwell's sister"}),
    (treadwellHouse:Location {name: "Mr. Treadwell's house", type: "dwelling"}),
    // {chapter: 13}
    (mall:Location:Institution {name: "Mid-Village Mall"}),
    (hollis:Person {name: "Hollis Write", leadership: true}),
    (police:Institution {name: "police"}),
    (adele:Person {name: "Adele T"}),
    // {chapter: 14}
    (dylar:Product {name: "Dylar", type: "drug"}),
    (dimitros:Person {name: "Dimitros Costakis"}),
    (elvis:Person {name: "Elvis Presley"}),
    (grappa:Person {name: "Nicholas Grappa"}),
    (lasher:Person {name: "Elliot Lasher"}),
    // {chapter: 15}
    (gladys:Person {name: "Gladys"}),
    // {chapter: 16}
    (compCenter:Institution {name: "computer center"}),
    (eric:Person {name: "Eric Massingale"}),
    // {chapter: 17}
    // {chapter: 18}
    (malcom:Person {name: "Malcom Hunt"}),
    (indonesia:Location {name: "Indonesia", type: "country"}),
    (quadaffi:Person {name: "Colonel Quadaffi", fullName: "Gadaffi"}),
    // {chapter: 19}

// EDGES
// I - WAVES AND RADIATION
// {part:1}
    // {chapter: 1}
    // (hill)<-[:EMPLOYED_BY {chapter: 1}]-(protagonist),
    (hill)<-[:MEMBER_OF {capacity: "department"}]-(hitlerDept),
    (hitlerStudies)-[:SUBJECT_OF]->(hitlerDept),
    (protagonist)-[:KNOWS_ABOUT]->(hitler),
    (hitlerStudies)-[:CREATED_BY]->(protagonist),
    (protagonist)-[:MEMBER_OF {capacity: "employment", leadership: true}]->(hitlerDept),
    (hill)<-[:MEMBER_OF {capacity: "employement", leadership: true}]-(chancellor),
    (chancellor)-[:ASSIST]->(nixon),
    (chancellor)-[:ASSIST]->(ford),
    (chancellor)-[:ASSIST]->(carter),
    (chancellor)-[:DIED_IN]->(austria),
    // {chapter: 2}
    (protagonist)-[:MARRIED_TO]->(babette),
    (volunteers)-[:ASSIST]->(blind),
    (babette)-[:MEMBER_OF]->(volunteers),
    (babette)-[:TEACHES]->(adEd),
    (babette)-[:READ]->(treadwell),
    (treadwell)-[:MEMBER_OF {capacity: "membership"}]->(blind),
    (treadwell)-[:LIKES]->(natEnquirer),
    (treadwell)-[:LIKES]->(natExaminer),
    (treadwell)-[:LIKES]->(natExpress),
    (treadwell)-[:LIKES]->(globe),
    (treadwell)-[:LIKES]->(world),
    (treadwell)-[:LIKES]->(star),
    (protagonist)-[:OWNS]->(stationwagon),
    (babette)-[:OWNS]->(stationwagon),
    (babette)-[:PARENT_OF {capacity: "mother"}]->(wilder),
    (wilder)-[:LIVES_IN]->(home),
    (babette)-[:LIVES_IN]->(home),
    (protagonist)-[:LIVES_IN]->(home),
    (denise)<-[:PARENT_OF {capacity: "mother"}]-(babette),
    (denise)-[:LIVES_IN]->(home),
    (steffie)-[:LIVES_IN]->(home),
    (heinrich)<-[:PARENT_OF {capacity: "father"}]-(protagonist),
    (heinrich)-[:LIVES_IN]->(home),
    // {chapter: 3}
    (cultDept)-[:LOCATED_IN]->(centuryHall),
    (hitlerDept)-[:LOCATED_IN]->(centuryHall),
    (alfonse)-[:MEMBER_OF {capacity: "employment", leadership: true}]->(cultDept),
    (murray)-[:MEMBER_OF {capacity: "employment", position: "visiting lecturer"}]->(cultDept),
    (murray)-[:LIVES_IN {role: "The Jew", permanent: false}]->(roomingHouse),
    (womanWithSecret)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (hautedMan)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (dunlop)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (letterboxWoman)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (noPastMan)-[:LIVES_IN {permanent: true}]->(roomingHouse),
    (home)-[:LOCATED_IN]->(blacksmith),
    (hill)-[:LOCATED_IN]->(blacksmith),
    (roomingHouse)-[:LOCATED_IN]->(blacksmith),
    (asylum)-[:LOCATED_IN]->(blacksmith),
    (barn)-[:LOCATED_IN]->(farmington),
    (protagonist)-[:TRAVEL_TO]->(barn),
    (murray)-[:TRAVEL_TO]->(barn),
    // {chapter: 4}
    (bee)<-[:PARENT_OF {capacity: "father"}]-(protagonist),
    (bee)<-[:PARENT_OF {capacity: "mother"}]-(tweedy),
    (bee)-[:KNOWS]->(steffie),
    (bee)-[:LIVES_IN {current: false}]->(korea),
    (babette)-[:READ]->(eroticFic),
    (chancellor)-[:ASSIST {type: "identity"}]->(protagonist),
    // {chapter: 5}
    // {chapter: 6}
    (heinrich)<-[:PARENT_OF {capacity: "mother"}]-(devi),
    (devi)-[:LIVES_IN]->(ashram),
    (ashram)-[:LOCATED_IN]->(tubb),
    (advNazism)-[:SUBJECT_OF]->(hitlerStudies),
    (protagonist)-[:TEACHES]->(advNazism),
    // {chapter: 7}
    (babette)-[:TEACHES]->(church),
    // {chapter: 8}
    (protagonist)-[:NOT_KNOWS]->(german),
    (dunlop)-[:KNOWS]->(german),
    (dunlop)-[:TEACHES {subject: "German"}]->(protagonist),
    // {chapter: 9}
    (murray)-[:AFFINITY_TO]->(babette),
    // {chapter: 10}
    (tommyRoy)-[:LOCATED_IN]->(prison),
    (prison)-[:LOCATED_IN]->(ironCity),
    (heinrich)-[:KNOWS {how: "playing chess"}]->(tommyRoy),
    // {chapter: 11}
    (dana)-[:MEMBER_OF {capacity: "employment"}]->(cia),
    (dana)-[:KNOWS]->(spanish),
    (dana)-[:KNOWS]->(portugese),
    (eugene)<-[:PARENT_OF {capacity: "father"}]-(babetteEx),
    (eugene)<-[:PARENT_OF {capacity: "mother"}]-(babette),
    (babetteEx)-[:PARENT_OF {capacity: "father"}]->(wilder),
    (babetteEx)-[:LIVES_IN]->(australia),
    (eugene)-[:LIVES_IN]->(australia),
    // {chapter: 12}
    (dunlop)-[:KNOWS]->(greek),
    (dunlop)-[:KNOWS]->(latin),
    (dunlop)-[:KNOWS]->(sailing),
    (dunlop)-[:KNOWS]->(meteorology),
    (bob)-[:PARENT_OF {capacity: "father"}]->(denise),
    (treadwellSister)-[:SISTER_OF]->(treadwell),
    (treadwell)-[:LIVES_IN]->(treadwellHouse),
    (treadwellSister)-[:LIVES_IN]->(treadwellHouse),
    // {chapter: 13}
    (treadwell)-[:LOCATED_IN {purpose: "lost"}]->(mall),
    (treadwellSister)-[:LOCATED_IN {purpose: "lost"}]->(mall),
    (hollis)-[:MEMBER_OF {capacity: "employment", leadership: true, position: "chief"}]->(police),
    (adele)-[:ASSIST {temporarily: true}]->(police),
    // {chapter: 14}
    (babette)-[:TAKES]->(dylar),
    (dimitros)-[:MEMBER_OF {capacity: "employment"}]->(cultDept),
    (dimitros)-[:KNOWS_ABOUT]->(elvis),
    (murray)-[:KNOWS_ABOUT]->(elvis),
    (grappa)-[:MEMBER_OF {capacity: "employment"}]->(cultDept),
    (lasher)-[:MEMBER_OF {capacity: "employment"}]->(cultDept),
    (gladys)-[:MOTHER_OF {capacity: "employment"}]->(elvis),
    // {chapter: 16}
    (compCenter)-[:MEMBER_OF]->(hill),
    (eric)-[:MEMBER_OF {capacity: "employment"}]->(compCenter),
    // {chapter: 17}
    // {chapter: 18}
    (malcom)-[:MARRIED_TO]->(tweedy),
    (bee)-[:LOCATED_IN]->(indonesia),
    (malcom)-[:LOCATED_IN]->(indonesia),
    (malcom)-[:MEMBER_OF {capacity: "employment"}]->(cia),
    (tweedy)-[:KNOWS]->(quadaffi),
    // {chapter: 19}


    ()