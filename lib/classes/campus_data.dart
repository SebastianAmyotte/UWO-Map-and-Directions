import 'package:gui_only/classes/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../buildings/building.dart';

//Name: Buildings information storage
//Date: 12/14/2022
//Description: This giant amalgamation of buildings contains all the information
//about all the buildings on campus. This file can be swapped in and out to
//change what is displayed in the app. To improve this, I would like to store
//this information on a server and have the app pull it from there. This would
//allow for easy updates to the app without having to update the app itself.

class Buildings {
  static double xLoc = 44.0260;
  static double yLoc = -88.5507;
  static double zoom = 15.5; //Zoomed in to cover school area
  static double compassAngle = 330.0; //Rotated so that campus is straight
  
  static Set<Building> buildingsList = {
    Building(
      name: "Arts and Communications Center",
      xLoc: 44.029582,
      yLoc: -88.552050,
      type: BuildingType.educational,
      threeSixtyPhotoName: "A&C",
      titleImage: "aandc.jpeg",
      history:
          '''State planning for the Fine Arts Building began in 1965 when was it was selected as part of a \$55.5 million System-wide building program. According to newspaper accounts, President Roger Earl Guiles hoped that construction would begin in 1967. His intentions proved ambitious, as it was not until late 1968 that the major planning of the building was completed and contracts were approved for construction. Two full years of discussions with the architect were required to satisfy the different departments and programs that would call the new building home. The building presented a unique challenge to planners due to the individual needs of various musical instruments, different art media as well as those of speech therapy, dramatics and color television production. At the time, these programs were poorly housed across campus and the faculty involved wanted to ensure their programs were finally given proper space.
        For years the Theatre, Music and Art Departments on campus had been given little attention to appropriate space. Often these departments, music especially, found space in houses purchased during  campus expansion. A Fine Arts Building was proposed to rectify the situation that would surely grow worse as enrollments continued to increase.
        This building may have been the first on campus financed in part by Title I of the Higher Education Facilities Act of 1963. The Regents requested \$1 million as funding for the project in 1967. The monies would be used to partially reimburse the state for the cost of construction, for what was, at the time, the largest academic instruction building in the Wisconsin State University System. Bids for the construction of the building came under budget allowing the Regents to spend the savings on equipment for the burgeoning campus television service.
        The facilities granted by the new building enabled the University to consider the creation of a Fine Arts School, a college separate from the College of Letters and Sciences on campus, an idea that suffered the same fate of others on campus at the time (PhD programs, law school, etc.) with the recession and drop in enrollment in the early 1970s.''',
      address: "1001 Elmwood Ave, Oshkosh, WI 54901",
      phoneNumber: "(920) 424-1234",
      description:
          "The building houses the Communications, Theatre, Art and Music Department offices, classrooms, the Allen J. Priebe Gallery, the Annex Gallery,  the 500 seat Music Hall, television and radio studios/stations as well as a 500-seat proscenium theatre and the Experimental Theatre, a \"black box\" facility.",
    ),
    Building(
        name: "Theatre Arts Center",
        xLoc: 44.02890925664894,
        yLoc: -88.55308882825176,
        type: BuildingType.educational,
        threeSixtyPhotoName: "theatre_arts_center",
        titleImage: "theatre.jpeg",
        description:
            '''The Theatre Arts Center is a 500-seat proscenium theatre. It has a computerized lighting control system, elevator equipped fore-stage and a fully functional fly system.
        Support facilities include nearby scenery and costume construction areas, prop and costume storage and a sound/light control booth. There are also two makeup rooms and private dressing rooms within.''',
        history:
            '''State planning for the Fine Arts Building began in 1965 when was it was selected as part of a \$55.5 million System-wide building program. According to newspaper accounts, President Roger Earl Guiles hoped that construction would begin in 1967. His intentions proved ambitious, as it was not until late 1968 that the major planning of the building was completed and contracts were approved for construction. Two full years of discussions with the architect were required to satisfy the different departments and programs that would call the new building home. The building presented a unique challenge to planners due to the individual needs of various musical instruments, different art media as well as those of speech therapy, dramatics and color television production. At the time, these programs were poorly housed across campus and the faculty involved wanted to ensure their programs were finally given proper space.
        For years the Theatre, Music and Art Departments on campus had been given little attention to appropriate space. Often these departments, music especially, found space in houses purchased during  campus expansion. A Fine Arts Building was proposed to rectify the situation that would surely grow worse as enrollments continued to increase.
        This building may have been the first on campus financed in part by Title I of the Higher Education Facilities Act of 1963. The Regents requested \$1 million as funding for the project in 1967. The monies would be used to partially reimburse the state for the cost of construction, for what was, at the time, the largest academic instruction building in the Wisconsin State University System. Bids for the construction of the building came under budget allowing the Regents to spend the savings on equipment for the burgeoning campus television service.
        The facilities granted by the new building enabled the University to consider the creation of a Fine Arts School, a college separate from the College of Letters and Sciences on campus, an idea that suffered the same fate of others on campus at the time (PhD programs, law school, etc.) with the recession and drop in enrollment in the early 1970s.''',
        address: "1010 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-4417"),
    Building(
        name: "Taylor Hall",
        xLoc: 44.02456781696769,
        yLoc: -88.55124891796204,
        type: BuildingType.residential,
        titleImage: "taylorHall.jpeg",
        history:
            '''Designed by the local architectural firm Sandstedt, Knoop and Yarbro, the unique, L-shaped building took advantage of available lots.  Originally intended to serve as a coed dormitory it was first pressed into service as the campus's largest women's dormitory. The building encloses on two sides a small yard that provided opportunities for outdoor recreation.  At one time it was a popular place for sun tanning and later a sand volleyball court was added.
        In 2005, extensive updates to Taylor Hall brought air conditioning and other improvements to each room as well as an updated and modern commons spaces including a new lobby.  The process also added 15 accessible rooms for disabled residents and an elevator.  Living in the more "luxury" environment required an additional charge to regular room rates.''',
        description: "Coed dormitory",
        address: "780 High Ave, Oshkosh, WI, 54901",
        phoneNumber: "(920) 424-1831"),
    Building(
      name: "Department of Engineering Technology",
      xLoc: 44.02883270863997,
      yLoc: -88.55273061678253,
      type: BuildingType.services,
    ),
    Building(
      name: "Halsey Science",
      xLoc: 44.0285752,
      yLoc: -88.5510983,
      type: BuildingType.educational,
      titleImage: "halsey.jpg",
      history:
          '''In late 1959, the Wisconsin state college system initiated a major building program across its campuses to address the space needs brought upon by a major expansion of the schools' curriculum. The Halsey Science Center was seventh on the project priority list of the \$21 million expansion. By February 1961, the Building Commission approved funds to finalize the planning of the building, among others in System.

              When completed in 1963, Halsey Science Center consisted of the eastern two buildings (the southern classroom and pit lecture-hall structure and the adjoined four story laboratory and office building) along Elmwood Ave. and the Buckstaff Planetarium. It was the first building project dedicated solely to education since Swart Hall was completed in 1928. System director Eugene McPhee was on hand to dedicate the facility and predicted that Oshkosh’s enrollment would be 13,000 by 1973. McPhee argued that facilities such as Halsey were essential to handle such numbers.

              Halsey Science Center expanded and improved upon the science classrooms and laboratories located within Harrington Hall. Chemistry, biology and physics departments, each requiring unique facilities and equipment for their work, made the move to Halsey while Geology remained in Harrington Hall.  The building was designed by the Oshkosh-based architectural firm of Sandstedt, Knoop and Yarbro and constructed by Ben B. Ganther Company.  

              In 1965, funds permitted the addition of a fourth building, the northern section along Woodland Ave. This was finished in 1969.''',
      hours: "9:00am to 3:00pm Monday through Friday",
      address: "921 Elmwood Ave, Oshkosh, WI 54901",
      phoneNumber: "920-424-1234",
      description:
          "The Halsey building is designed for the Chemistry, Physics-Astronomy and Biology Department offices, as well as laboratories, classrooms and a greenhouse.",
      threeSixtyPhotoName: "halsey",
      people: [
        People("Dr. Hannah Hillberg",
            imageFileNameAndExtension: "HannahHillberg.jpg",
            email: "hillbergh@uwosh.edu",
            officeAddress: "Halsey Science Hall 217"),
        People("Dr. David Furcy",
            imageFileNameAndExtension: "DavidFurcy.jpg",
            email: "furcyd@uwosh.edu",
            phoneNumber: "(920) 424-1182",
            officeAddress: "Halsey Science Hall 221"),
        People("Dr. Michael Rogers",
            imageFileNameAndExtension: "MichaelRogers.jpg",
            email: "rogersm@uwosh.edu",
            officeAddress: "Halsey Science Hall 214",
            phoneNumber: "(920) 424-1388"),
        People("Local Cool Guy",
            imageFileNameAndExtension: "SebastianAmyotte.jpg",
            phoneNumber: "(000) 123-4567",
            email: 'amyots21@uwosh.edu',
            officeAddress: 'Halsey Science Lounge'),
      ],
    ),
    Building(
      name: "Swart Hall",
      xLoc: 44.0279898,
      yLoc: -88.5519907,
      type: BuildingType.educational,
      titleImage: "swart.jpeg",
      history:
          '''The WWI ban on all state building projects not related to war service severely affected the Oshkosh Normal School. After a fire destroyed the Original Normal Building in 1916, the building known today as Dempsey Hall replaced only the Science, Administration and Library units of the Normal School. The school lacked the important practice school and an auditorium. After Armistice, two successive legislatures failed to provide the funds for construction of a practice school. By 1923, the Oshkosh Northwestern was complaining about the “junky” conditions of the older buildings that remained on campus (the Barracks and gymnasium turned Auditorium). President Harry A. Brown argued that these buildings were “dingy, dilapidated, and unsafe.” The Advance editorialized that the legislature should not build a cheap addition to an existing building and that only a freestanding building would do.
        Finally, the legislature appropriated the money for the construction of a practice school that would contain a theater/auditorium but one much smaller than Brown had planned. The legislature’s parsimony brought problems later on when there were insufficient funds to clean up the building site after construction ended. Some 3,600 cubic yards of excavated dirt piled high above the first-floor windows greeted visitors as they approached the newly opened building. The “dunes” caused extensive damage due to water build up between them and the building. Eventually these were removed
        The new 50-room building provided the training school a fine laboratory in which to train practicing teachers as well as a safe and modern school for area parents to send their children. Brown proclaimed the building no less important to a Normal School than a hospital is to a medical school. It was said at the time that the facility was one of the six most commodious and best training school buildings in the United States. The classrooms of the first six grades were arranged in suits of three, and the junior high was located on the third floor. The school had many conveniences such as a large study hall with a stage and a demonstration room that could sit 144 people. Included were a cafeteria, children's clinic, library and a gymnasium with showers. Between 1942-1943 the building was home to over 1,000 army air corps recruits (400 at a time) training at the Oshkosh State Teachers College.
        In 1974, the University phased out its campus school after 103 years of operation and began experimenting in providing unique services to the Oshkosh public school system, including a program for at-risk students. 
        Owing to its original purpose, a portion of Swart Hall was used as the University's Head Start pre-school and a daycare center.  The Little Theater in Swart continued to be used for films, performances and presentations. 
        In 1990, Swart Hall underwent a major renovation that gutted most of the interior spaces, to provide modern office spaces and classrooms, a large computer laboratory and improved facilities for the daycare center.  Swart's gymnasium and The Little Theater were both lost to the improvements.  
        Renovation is planned in Swart Hall during 2021 to provide increased classroom and lab space for the anthropology program. In addition to space reconfiguration, the project includes mechanical electrical and technology updates and new furniture that supports interactive group learning.  The space will be used to teach methods and analytical techniques for forensic anthropology.''',
      address: "912 Algoma Blvd, Oshkosh, WI 54901",
      phoneNumber: "(920) 424-1234",
      description:
          "Houses the Mathematics and Psychology Departments and classrooms.",
    ),
    Building(
        name: "Harrington Hall",
        xLoc: 44.02770564675112,
        yLoc: -88.55025123507181,
        type: BuildingType.residential,
        titleImage: "harrington.jpeg",
        history:
            '''In the early part of the 20th century, there was a growing belief that industrial education needed a larger role in U.S. education and the Oshkosh Normal School responded by adding courses to prepare teachers for this new expanding discipline. Originally handicrafts such as basketry, sheet metals, book binding and carving were taught. In 1909, Richard Gruenhagen expanded the offerings to include cabinet making for which he was well known in Oshkosh. Industrial Education became an official Department in the school in 1912 with a building of its own and a new director, Hans Schmidt. Schmidt's leadership and innovation at Oshkosh later earned him the position of State Superintendent of Industrial Arts.
        In the 1920s, the Oshkosh Normal School helped to fulfill the growing need for industrial arts educators through the expansion of the program. The students, most, if not all, of them men and many of them World War I veterans, learned to produce wonderful pieces of furniture as well as discover the secrets of foundry work, mechanical drawing and machine shops. At the same time, these students learned pedagogical methods and took their skills, in practice, to the upper grades of the city's schools. The influx of male students at Oshkosh Normal School greatly enhanced the social life of the school as well as its athletic teams.
        As the 1920s moved into the 1930s, the demand for industrial arts teachers began to diminish. Meanwhile the Stout Institute, now in state hands, strengthened its position as the leading manual training facility in Wisconsin, drawing many students away. Ultimately, in 1937, the Board of Regents closed Oshkosh Normal’s industrial arts program due to shrinking enrollments. The Industrial Building began a new life as classrooms for science instruction. In 1947, war surplus materials from an ordnance plant in Illiopolis, IL were purchased to add on a chemistry laboratory to the building.
        In 1964, after the opening of the Halsey Science Center, Harrington was renovated for the geography and geology programs.''',
        address: "845 Elmwood Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description:
            "Presently, Harrington Hall houses the geology and anthropology departments and their classrooms, labs, and collection storage."),
    Building(
        name: "Oviatt House",
        xLoc: 44.02714182660109,
        yLoc: -88.55147852174821,
        type: BuildingType.services,
        titleImage: "oviatt.jpeg",
        history:
            '''The Regents purchased the Oviatt House in 1913 and is UW Oshkosh’s oldest building still standing. The Oviatt House was originally designed for Oshkosh attorney Moses Hooper, an authority on water power laws and a long-serving legal counsel for Kimberly Clark. Hooper chose local architect William Waters to build this Gothic Revival style home of blue limestone. The interiors were decorated with many unique features owing to Hooper's tastes and sophistication.  
        Hand-painted tiles depicting scenes from Shakespeare's plays line one of the house’s various fireplaces. The formal dining room was surrounded by a mural of wooded scene and is believed to have been painted by local artist, Gustave Behncke.
        The attic featured a cistern that supplied the house running water, a unique feature in the 1880s.  
        Dr. Charles W. Oviatt, a notable surgeon and physician, purchased the home in 1900.
        Oshkosh Normal President John A. H. Keith recommended buying the property as a female dormitory as early as 1908. The Advance, in 1912, advocated the buying of the house so female students could develop “regular habits” under the guidance and supervision of a housemother. Such an individual, the newspaper reported, could lessen the students’ homesickness and help defeat their exposure to “unwise amusements.” After its purchase, the Oviatt House fulfilled the needs of its 12 female residents and the 20 more who ate meals there. It soon became a campus social center.
        Although the females benefited from the Oviatt House, there were limited accommodations, and discussions of replacing the house’s mission began in 1930.
        In 1934, the house became a president's home, and continued to serve that function until 1990 when the house became headquarters of the University of Wisconsin Oshkosh Foundation.
        In 1979, the house was listed in the National Register of Historic Places in the United States under the name of the Hooper-Oviatt house.''',
        address: "842 Algoma Blvd, Oshkosh, WI, 54901",
        phoneNumber: "(920) 424-1234",
        description: "Offices"),
    Building(
        name: "Horizon Village Residence Hall",
        xLoc: 44.02437939476632,
        yLoc: -88.547945627324,
        type: BuildingType.residential,
        titleImage: "horizon.webp",
        history:
            '''On November 15, 2010, the University of Wisconsin Oshkosh broke ground on a new suite-style residence hall. This is the first new Residence Hall Facility on the UW Oshkosh campus since 1967.
        Horizon Village is UWO’s only suite-style residence hall on campus.  Horizon Village offers four-bedroom (all roommates get their own single bedroom) or two-bedroom (roommates live in pairs) living options. This hall features brand new amenities with lots of gathering spaces to easily stay connected with others in the hall.  Gathering spaces include: 2 lounges on every floor, kitchenettes throughout the building, conference rooms, study rooms, and much more!  Horizon takes pride in sustainable living efforts, as it was built with geothermal energy use and made Gold status in the LEED Green Building Rating System. Starting in the 2021-2022 academic year, Horizon Village offers open gender four-bedroom suites, where residents from all gender identities and expressions can choose to live together.''',
        address: "635 Elmwood Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1819",
        description: "Coed dormitory"),
    Building(
        name: "UWO Police Department",
        xLoc: 44.023795145381094,
        yLoc: -88.54996213935422,
        type: BuildingType.services,
        titleImage: "policeDept.png",
        history:
            '''Over the years, several houses were built at 738 High Ave. before American District Telegraph (ADT) constructed its alarm center there in 1960. At the time, ADT had several large clients among the banking and industrial community in Oshkosh and this facility would monitor the alarms of those facilities.  
        In 1996, the building was acquired by the UW Oshkosh Credit Union for \$96,000. The building was purchased by the UW Oshkosh Foundation in 2003 and in 2007 it was sold to the University for use as a Faculty Development Center after the Credit Union moved to new offices on Wisconsin St.. 
        Not long after that, the building became the new office of the UWO Police Department.''',
        address: "777 Algoma Blvd., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1212",
        description: "University Police Headquarters"),
    Building(
        name: "Blackhawk Commons",
        xLoc: 44.02363646045514,
        yLoc: -88.54891647566491,
        type: BuildingType.residential,
        titleImage: "blackhawk.jpeg",
        history:
            '''Blackhawk Commons was the third and last dining hall built on campus after Elmwood and River Commons and it is the only one of the three to survive as a dining hall.  On July 28, 1982 a fire raced through Blackhawk Commons  just days before it was to serve meals to hundreds of guests who were staying on campus during the EAA fly in. 
        The damage was extensive. The reconstruction of the facility took three years to complete and in 1985, Blackhawk opened again, with a new bookstore and dining area.  In 2001, Blackhawk Commons was reimagined as the single “marketplace-style" dining hall on campus as part of "Project 2000", a joint Reeve Union and Blackhawk renovation project that moved the bookstore to Reeve Union.''',
        address: "725 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description: "Dining hall and parking offices.",
        hours: '''M-F: 7:30AM-8PM
        Weekend: 10AM-6PM'''),
    Building(
        name: "Dempsey Hall",
        xLoc: 44.0265945912381,
        yLoc: -88.55070273026278,
        type: BuildingType.services,
        titleImage: "dempsey.jpeg",
        history:
            '''At the time of Original Normal School fire in 1916, the foundation of Dempsey Hall had already been excavated in front of the 19th century building.  Administrators planned for the new building to be attached to the old via a hallway and to serve as a new science facility.  In time, the older sections of the original building were to be destroyed.  The loss of the entire Original Normal Building and its newer additions due required the new building to serve many more uses and be expanded upon quickly. The structure (built on plans similar to those of Schofield Hall at UW Eau Claire) was built in three sections. The first, finished in 1917, became the science and administration wing is the frontage seen along Algoma Blvd.The second wing, finished in 1918, served as the library wing, southeast of the original. The building was not “completed”, however, until much later--in 1969--and for most of the in between years, a tennis court occupied the northeast corner of the space. Most likely it was World War I that stymied the completion of this building. By 1917 there was a ban on new state construction not intended for the war effort. Prior to the ban, it was assumed that the state legislature would appropriate funds to build an auditorium unit in the unfinished space.''',
        address: "800 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description:
            "Houses administrative offices, information technology department and UWO’s mainframe computers."),
    Building(
        name: "Polk Library",
        xLoc: 44.0263519514735,
        yLoc: -88.54957751053314,
        type: BuildingType.services,
        titleImage: "polk.jpeg",
        history:
            '''Polk library’s north wing was constructed in 1961-1962 via a \$1.5 million appropriation from the State Building Commission. The building planning began in 1958 under President Polk and was the second facility built during the large-scale, state-supported building program on the campus after WWII (Albee Hall was first). The Forrest Polk Library replaced the library housed on the second and third floors of the southeast corner of Dempsey Hall
        Echoing a familiar pattern on campus, the Dempsey Hall library was not adequate for the number of students coming to campus in the late 1950s or the college's expanded liberal arts curriculum which required from the library a greater variety of books and academic journals. The stacks, seating area and service counters were all undersized and could not provide the study and collection space required by the growing college. The construction of the first wing of Polk Library helped finalize the concept of a central pedestrian mall running through campus between Woodland Ave. and Reeve Union.  Neighbors on Elmwood Ave. complained because the building, unlike Harrington Hall, was built "backwards," facing away from the street, 
        Built in the International Style of architecture, Polk Library was designed by local architectural firm, Irion and Reinke.  Distinctive on campus, Polk stands out with its large limestone and granite panel facings, large windows and metal brise-soleils.  The interior has an open concept using pillars rather than walls to bear the load of the building.  
        The original building was built for ten year’s worth of growth, and land was reserved for the eventual expansion of the building. The expansion, however, would be completed even sooner.  In 1969, the second, south wing of Polk Library was completed more than doubling the size of the library.  Referred to as the "Polk Addition" even 50 years later, the south wing added more office, study and collection space as well as classrooms and unique spaces in the basement for other university services.  
        A renovation completed in 1989 pushed out a heated foyer onto the buildings porch that allowed for a public elevator to the south wing basement.  The project also closed Elmwood and north side entrances to the building.''',
        address: "Polk Library, Elmwood Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-4333",
        description:
            "Houses library collections of UW Oshkosh campus, media services offices, studios, computer labs and workrooms, classrooms, the testing center and the offices of custodial services.",
        hours: '''
          Sun-Thu: 7AM-12AM
          Fri: 7AM-6PM
          Sat: 10AM-6PM
        '''),
    Building(
        name: "Albee Hall",
        xLoc: 44.02563925669,
        yLoc: -88.55005062563664,
        type: BuildingType.sport,
        titleImage: "albee.jpeg",
        history:
            '''Albee Hall’s construction was significant as it was the first educational facility built on campus since Swart Hall’s completion in 1928. Unlike the Radford Hall dormitory built in 1952, Albee Hall was built with state funds making it the first building of many to be built by state funds at the Oshkosh campus in response to the school’s expansion into liberal arts baccalaureate education. 
        In 1949, the Wisconsin legislature passed a bill that allowed schools to adopt liberal arts and pre-professional degrees and programs. By 1951, Oshkosh State Teachers College became Oshkosh State College, conferring degrees for the first time beyond teacher training. The new curriculum attracted men and women in greater numbers and a near constant increase in enrollment followed.  To make room for the students and facilities necessary for the new programs, a mass building expansion on campus began with the erection of Radford and Albee Halls.
        Albee Hall was built to modernize the campus physical education facilities as the school's gymnasium was not sufficient for the growth of the school’s physical education and health programs as well as intramural and interscholastic athletics. Still, the building had its limitations known even before its completion. Upon a visit in 1955, the Director of the State Planning Commission commented that the facility had no space for outdoor activities.
        Originally budgeted for \$750,000, the incoming bids made it clear that another \$100,000 would be needed to furnish and equip the building and monies were found in the balances of other state construction projects.
        Albee Hall’s ground breaking was not an ordinary affair, Governor Walter Kohler came to Oshkosh for the event and numerous guests, both from the school and community, were on hand to witness the event.  Kohler used the ground breaking as an opportunity to discuss the major \$14 million building program (part of a \$93 million statewide program) the state colleges were enjoying. The Albee ground breaking was the first of five in the State Colleges System that year. The construction of the physical education building, Kohler stated, marked a rededication on the part of Wisconsin people to “preserve and strengthen one of the finest education systems in the United States.”''',
        address: "776 Algoma Blvd, Oshkosh, WI 54902",
        phoneNumber: "(920) 424-1245",
        description:
            "Albee Hall contains a new swimming pool (completed in 1992 and opened in February of 1993), practice gymnasium, physical education offices and an multiuse gymnasium for games,  speakers, concerts and other large events."),
    Building(
        name: "Student Success Center",
        xLoc: 44.02618573204117,
        yLoc: -88.54801089168325,
        type: BuildingType.services,
        titleImage: "studentSuccess.jpeg",
        history:
            '''When it opened in early 1966, Elmwood Commons was the first free-standing dining hall to be built on campus.  Like the Halsey Science Center just down the road, Elmwood Commons was designed by the local architectural firm Sandstedt, Knoop and Yarbro to serve the residents of the eastern dormitories while River Commons would serve those on the western side of Algoma Blvd.  Funds for the building were borrowed from the Housing and Home Finance Agency and paid back from operating revenues.  The building featured two serving lines and dining rooms as well as a private dining area that once featured a mural of a scene from The Hobbit fantasy novel.   
        After dining services were located exclusively in Blackhawk Commons and Reeve Union, Elmwood Commons operated for a brief period as the campus Newman Center after its building was purchased by the University.  
        In 2009-2010, Elmwood Commons underwent substantial renovation and expansion to create a single location for student support activities.  Featuring many sustainable approaches the retrofit resulted in the building receiving Leadership in Energy and Environmental Design (LEED) Silver Certification by the U.S. Green Building Council.''',
        address: "750 Elmwood Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description: "Renovated into the student support services building."),
    Building(
        name: "Reeve Memorial Union",
        xLoc: 44.0252,
        yLoc: -88.5489,
        type: BuildingType.services,
        threeSixtyPhotoName: "Reeve",
        titleImage: "reeve.jpeg",
        history:
            '''In January 1949, May Fraker donated her home adjacent to campus buildings to be used as a social center for students on the condition it be named after her grandfather, Thomas T. Reeve. When the house opened to students and staff in September 1951, Reeve Memorial Union offered a lounge with a television and radio, a snack bar.  Later a small bookstore was added so that students could buy supplies and souvenirs. Upstairs were four dormitory rooms for female students that tried to alleviate the huge dearth of dorm space on campus. To renovate the property, the Regents provided \$20,000.
        In 1956, the Regents voted to the house with a larger union building on that site and nearby property. Construction contracts were finalized in December 1957.
        The new building, finished and opened in 1959, consisted of the front of the current building on the Algoma side and cost \$610,000, all paid for through federal loans and student fees. No tax dollars were used to build or furnish the union, a theme that repeats itself throughout the Union’s history.
        In response to skyrocketing enrollment and the corresponding construction of dormitories, the Union was expanded just a few years later. From 1963 to 1964, construction crews tripled the size of Reeve Union adding over 60 new rooms to include a host of new recreational, artistic and social opportunities.
        In 1988, the Union began a renovation project to create new meeting and study spaces and a new area of diverse dining options. The renovation also brought a new look to the mall-side entrance. Just as the original Union building quickly grew insufficient for the changing student body, the renovation of the eighties could not meet the new needs of an ever-changing campus. Within ten years, the Union staff was planning another major overhaul.
        In 1996, plans began to add onto the Union once more. Known as Project 2000, this renovation process involved both the Union and Blackhawk Commons. The project, completed in 2003, brought the University Bookstore back to the Union but required the loss of the bowling alley. Project 2000 added an art gallery named after long serving Union staff member Gail Steinhilber as well as many new and flexible meeting spaces that positioned Reeve Union to market itself for events.  
        The expansion was also a major departure from an architectural perspective.  The project replaced most of the 1964 additions with a massive airplane hanger-like structure featuring a large southern side of glass and steel.  Milwaukee-based architect Jan van den Kieboom designed the addition and it was his first education building project.
        In 2017, renovations to the original, Algoma-facing section, untouched during Project 2000, were completed. The changes included an ADA compliant entrance and a new student leadership center for campus organizations.  As a result of this last project, few spaces in the Reeve Union remain from its original construction.''',
        address: "748 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-2345",
        description:
            "Designed as a meeting, social and recreational space for students and staff, the buildings housed dining facilities, a bookstore and textbook library.",
        hours: '''
          M-F: 8AM-5:30PM
          Weekend: Closed
        '''),
    Building(
      name: "Evans Hall",
      xLoc: 44.026196792804136,
      yLoc: -88.54737500299301,
      type: BuildingType.residential,
      titleImage: "evans.jpeg",
      history:
          '''Evans Hall opened for the first time in the fall of 1965 along with its neighbor Stewart Hall as well as Nelson Halls, each with 244 rooms.  In the early 1970s, due to shrinking enrollment, the building was briefly used as a conference center and graduate student dorm.''',
      address: "727 W. Lincoln Ave., Oshkosh, WI 54901",
      phoneNumber: "(920) 424-1825",
      description: "Co-ed, first year dormitory",
    ),
    Building(
        name: "Stewart Hall",
        xLoc: 44.02607230449605,
        yLoc: -88.54692976860981,
        type: BuildingType.residential,
        titleImage: "stewart.jpeg",
        history:
            '''Stewart Hall, built in 1965 along with its sister dormitory, Evans Hall next door.  The pair shared a identical floor plans that featured two adjoining cubes.  A formal dedication to the halls and was held in December of 1965, although students had moved into the buildings earlier in the fall. 
        Over the years, Stewart Hall experimented with different approaches to housing students and was even closed in 1973 for a year due to low enrollment.  In 1985, the University proposed to the Gamma Phi Beta sorority that they house members in one wing of the hall but this was rejected by the sorority.  Renovations began in 1992 to transform Stewart into an apartment-like complex renamed the Stewart Community featuring mostly single rooms.  Larger closets,  furniture, refrigerators and microwaves differentiated the rooms from the others across campus. The residence was now coed housing only upperclass students.
        Stewart Hall participated in many activities over the years.  For many years an all-women's dorm, the hall often participated in coed campus events paired with the mens-only Fletcher Hall. The dorm’s Cider Jug Street Dance once involved the closing the adjacent section of Lincoln St. Later, the Stewart/Evans County Fair and other events have attempted to bring the halls together in a unique community.''',
        address: "723 W. Lincoln Ave., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1801",
        description: "A coed, first year living environment."),
    Building(
        name: "Fletcher Hall",
        xLoc: 44.025354055736614,
        yLoc: -88.54723686382543,
        type: BuildingType.residential,
        titleImage: "fletcher.jpeg",
        history:
            '''In the early 1960s, Oshkosh State College was growing rapidly. Increasing enrollment due to the baby boom generation required the school to expand its physical plant. Fletcher Hall was the largest of the school’s original ten low-rise residence halls. Opening in 1964, it housed up to 520 male students. The dormitory went coeducational by 1970.  Massive and modern, Fletcher Hall, when it opened, was the “crown jewel” of residence life at Oshkosh.
        Due to its available space, the Fletcher Hall basement became home to a fitness center in 1985. When it opened, membership for the center cost \$30 per year and featured 14 Nautilus fitness machines, exercise classes, and a “computer with programs on nutrition and fitness.” Eventually, the center was closed when the Student Recreation and Wellness Center opened in 2007.
        Fletcher Hall’s size and location near Reeve Memorial Union made it a popular choice for undergraduates. Over the decades, the hall has developed a reputation as a social hotspot with a strong history of involvement in Hall Government, Homecoming, and Winter Carnival events. The culture of a hall changes with each passing class, but Fletcher has maintained its irreverent and active attitude - from anti-Vietnam peace sit-ins, cheeky in-hall newsletters to floors devoted to artists or the first-year experience. Throughout the 1980s and 1990s, Fletcher Hall alone remained open all-year long, and thus was the appropriate hall to house many of the University's international students who were not always able to return home during breaks. Fletcher’s international student population brought diversity to the Oshkosh campus:  it was the site of Hindu celebrations, multicultural festivals, and frequent meetings of the Club International, an organization created to increase knowledge and understanding of other cultures and ethnicities. The impact that the willingness of these students to share their cultures and involve themselves in campus affairs had on the well-being of the university is immeasurable and contributed to Fletcher Hall’s unique atmosphere.
        In 2017, Fletcher Hall underwent a complete renovation and expansion that included new large common areas in the front of the building.''',
        address: "712 Elmwood Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1731",
        description: "Coed dormitory."),
    Building(
        name: "Campus Center for Equity and Diversity",
        xLoc: 44.02463586460775,
        yLoc: -88.54710835250582,
        type: BuildingType.services,
        titleImage: "CCED.jpeg",
        description:
            '''The Campus Center for Equity and Diversity (CCED) is home to the Office of Academic Support for Inclusive Excellence (ASIE).  ASIE is dedicated to the academic growth and personal development of UW Oshkosh students comprising first-generation, low-income, students of color, women, and LGBTQ+ students.
        ASIE aims to empower and inform students, faculty, staff, and the broader community to create a diverse, equitable and inclusive campus climate through outreach initiatives, educational programming, leadership opportunities and multicultural events.''',
        address: "17 W. Irving Ave. Oshkosh, WI 54901",
        phoneNumber: "(920) 424-3080",
        hours: "M-F: 7:45AM-4:30PM"),
    Building(
      name: "Lincoln Hall",
      xLoc: 44.02318839144848,
      yLoc: -88.54629798545383,
      type: BuildingType.services,
      titleImage: "lincoln.jpeg",
      address: "401-523 WI Trunk 44, Oshkosh, WI 54901",
    ),
    Building(
        name: "South Scott",
        xLoc: 44.02251528427534,
        yLoc: -88.54727793055748,
        type: BuildingType.residential,
        titleImage: "southScott.jpeg",
        address: "625 Algoma Blvd, Oshkosh, WI 54901"),
    Building(
        name: "Scott Hall",
        xLoc: 44.0228,
        yLoc: -88.5475,
        type: BuildingType.residential,
        titleImage: "scott.jpeg",
        history:
            '''Scott Hall was the second complex of "High Rise Dorms" after Gruenhagen Hall and the last dormitory built on campus until Horizon Village was constructed in 2012. 
        Built in 1967, Scott Hall could house more than 1200 students. Slightly larger but very similar to Gruenhagen, the same architectural design is also found on other campuses in UW System, including UW Madison's Witte Hall and UW Whitewater's Wells Hall.

        Originally the residence, despite having two towers, was considered a single dormitory.  Scott Hall eventually ‘split’ into two dorms, North and South, each with their own identity.  During the 1970s Scott Hall created a floor specifically for international students. More recently, Scott Hall has recently been home to specialty floors such as the ‘Rainbow Floor’, the honors floor, and business students floor. Due its location along the busy Algoma Blvd. and on the edge of campus, Scott Hall’s residents had a front-row seat to some of the campuses most rowdy events, from anti-Vietnam protests of the early 1970s to drinking-age protests of 1989.   
        For many years, Scott Hall participated in the ‘Sink or Float’ Regatta, a celebration that first started at Menominee Park, along the beach at Lake Winnebago. Activities at the Regatta included canoe races, live music, and a grill out picnic. Later, the celebration was moved to campus to be accessible to more students. Scott Hall student government also participated in many  charity events and hosted its own social events often taking advantage of its unique setting.''',
        address: "625 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1162",
        description: "Coed dormitory."),
    Building(
        name: "Alumni Welcome and Coference Center",
        xLoc: 44.020545171746726,
        yLoc: -88.55039540258574,
        type: BuildingType.services,
        titleImage: "alumniWelcome.jpeg",
        address: "625 Pearl Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-3300",
        hours: '''
          M-F: 8AM-4PM
          Weekend: Closed
        '''),
    Building(
        name: "Student Recreation and Wellness Center",
        xLoc: 44.02173171229066,
        yLoc: -88.5515548645398,
        type: BuildingType.sport,
        titleImage: "rec.jpeg",
        address: "735 Pearl Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1245",
        hours: '''
          M-F: 6AM-11PM
          Weekend: 6AM-10PM
        '''),
    Building(
        name: "Tennis Court 1",
        xLoc: 44.02271479958085,
        yLoc: -88.55130718549175,
        type: BuildingType.sport,
        titleImage: "tennis.jpeg",
        address: "800 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-7142"),
    Building(
        name: "Tennis Court 2",
        xLoc: 44.02341136693423,
        yLoc: -88.5506376829333,
        type: BuildingType.sport,
        titleImage: "tennis.jpeg",
        address: "800 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-7142"),
    Building(
        name: "Tennis Court 3",
        xLoc: 44.02341136693423,
        yLoc: -88.5506376829333,
        type: BuildingType.sport,
        titleImage: "tennis.jpeg",
        address: "800 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-7142"),
    Building(
      name: "Kolf Sports Center",
      xLoc: 44.024521816964224,
      yLoc: -88.55257061727578,
      type: BuildingType.sport,
      titleImage: "kolf.jpeg",
      history:
          '''When Albee Hall expanded the physical education facilities on campus, the enrollment was 1,397 students. When the Kolf Physical Education and Sports Center was considered enrollment had increased beyond 10,000. Albee’s facilities certainly could not support this size of a student body.  The University needed a home for its growing physical education program as well as to an expanded array of intercollegiate athletics that was increasingly attracting female athletes as well as men (although for many years, women's basketball used the Albee gym).
        Construction of the 145,000 sq foot facility situated on former industrial land, was completed in the school's Centennial year of  1971 for the cost of \$4.2 million including equipment.
        In addition to the home of the school's physical education department and intercollegiate athletics, Kolf Sports Center features a 6,300 seat field house, three lower gyms, a dance studio and a rifle range as the University's military science department is also housed in the building. 
        As the structure with the largest seating capacity on campus, Kolf Sports Center has hosted major speakers, concerts, events as well as the University's Spring and Winter  commencement exercises.''',
      address: "785 High Ave, Oshkosh, WI 54901",
      phoneNumber: "(920) 424-1034",
      description:
          "The building contains three gymnasiums, classrooms, five basketball courts, an indoor track, a rifle range, an athletics department and ROTC offices.",
    ),
    Building(
        name: "ROTC Office",
        xLoc: 44.024152841663394,
        yLoc: -88.55198304953198,
        type: BuildingType.services,
        titleImage: "default.png",
        address: "800 Algoma Blvd #3551, Oshkosh, WI 54901",
        phoneNumber: "(920) 318-1011",
        hours: "M-F: Open 24 hours"),
    Building(
        name: "Environmental Research and Innovation Center",
        xLoc: 44.02352303678323,
        yLoc: -88.55381799725127,
        type: BuildingType.services,
        titleImage: "default.png",
        address: "783 Pearl Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-3148",
        hours: "M-F: 8AM-4PM"),
    Building(
        name: "Sage Hall",
        xLoc: 44.025868171958344,
        yLoc: -88.55363086780682,
        type: BuildingType.educational,
        threeSixtyPhotoName: "sage",
        titleImage: "sage.jpeg",
        history:
            '''Sage Hall, UW Oshkosh’s first new academic building since 1971, opened for classes in fall 2011. The word “sage” has multiple meanings that lend themselves to an academic building that is energy efficient, including:
        a mentor in spiritual and philosophical topics who is renowned for profound wisdom, having wisdom that comes with age and experience, aromatic fresh or dried gray-green leaves used widely as seasoning, any of various plants of the genus Salvia; a cosmopolitan herb

        The word “sage” also is associated with Socrates and the Socratic Method of inquiry, and it aligns well with the “Nature of Wisdom” and “Wisdom of Nature” phrases imprinted in the decorative cast stone panels located on the building’s exterior.
        More than \$5 million in private funds were raised in support of the four-story, 191,000-square-foot building, which took two years to construct.''',
        address: "835 High Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234"),
    Building(
        name: "College of Business",
        xLoc: 44.02555151377204,
        yLoc: -88.55385221025794,
        type: BuildingType.educational,
        threeSixtyPhotoName: "college_of_business",
        titleImage: "business.jpeg",
        address: "Sage Hall, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-0297"),
    Building(
        name: "Heating Plant",
        xLoc: 44.02821623692502,
        yLoc: -88.5543497315857,
        type: BuildingType.other,
        titleImage: "heating.jpeg",
        history:
            '''The Central Heating and Chilling Plants are located on the north side of the Oshkosh campus. The Heating Plant is a 24/7, 365-day operation that provides steam to all campus buildings throughout the year for heat, hot water and cooking steam in Blackhawk commons. The Chilling Plant is attached to the Woodland Ave. side of the Heating Plant and provides chilled water to campus buildings for cooling in the summer months. The primary fuels for making steam are #2 fuel oil and natural gas. The university stopped burning coal in 2020. 
        The Heating Plant consists of four boilers, two 45,000 lbs. /hr., one 25,000 lbs. /hr., and one 100,000 lbs. /hr. that are capable of burning natural gas.  The 25,000 lbs. /hr. and 100,000 lbs. /hr. can also burn No.2 fuel oil. 
        During 2000-2001, the University installed a 15,000 sq. ft. addition to the Heating Plant in order to accommodate two 1400 ton and one 450 ton central chillers, associated piping, cooling towers, electrical and mechanical support equipment. A chilled water loop was also buried that runs directly underneath the main pedestrian mall and along High Ave. that services the core of the academic campus.
        The Central Heating Plant employs highly trained and licensed boiler operators. The Central Heating Plant shuts down for one week every year after spring graduation in conjunction with our Facility Management teammates to perform on campus repairs, boiler and equipment inspections and maintenance that cannot be performed when the plant is in operation. The Heating Plant looks forward to the challenges presented to us so we can continue to provide uninterrupted services at the lowest possible cost to our valued users.''',
        address: "1010 Woodland Ave., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-4484"),
    Building(
        name: "Fox Valley Tech Riverside Campus",
        xLoc: 44.018859465692856,
        yLoc: -88.55429600669545,
        type: BuildingType.educational,
        titleImage: "fvtc.jpeg",
        history:
            '''Starting in 1912, city vocational schools were formed at six locations (Appleton, Brillion, Kaukauna, Menasha, Neenah, and Oshkosh) in the current district. In 1967, the Wisconsin Legislature divided the state into sixteen districts, which led to the formation of Fox Valley Technical Institute (FVTI). In 1987, the college (along with all of the state technical colleges) was renamed and it became known as Fox Valley Technical College.''',
        address: "150 N Campbell Rd, Oshkosh, WI 54902",
        phoneNumber: "(920) 233-9191",
        hours: '''
          M-Th: 7AM-10PM
          Fri: 7AM-4PM
          Weekend: Closed
        '''),
    Building(
        name: "Campus Services",
        xLoc: 44.01904789684353,
        yLoc: -88.5567619049967,
        type: BuildingType.services,
        titleImage: "campus-services.jpeg",
        address: "650 Witzel Ave., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234"),
    Building(
        name: "JJ Keller Field at Titan Stadium",
        xLoc: 44.023644188496924,
        yLoc: -88.56316646119585,
        type: BuildingType.sport,
        titleImage: "stadium.jpeg",
        history:
            '''The stadium was built in 1970.[2] The stadium has a capacity of 9,800 people. It was renovated in 2004 for nearly \$10 Million to update the facility, include the capability to play soccer, as well as a turf field.[3]
        
        The stadium has one large grandstand on the West side of the field. There is a running track around the stadium. The football playing field is not centered, rather it is closer to the grandstand, improving visibility from there.
        
        There is, in addition, a smaller running track/soccer field located next to Titan Stadium.
        
        In 2007 and 2008, the DIII National Track and Field Championships were hosted at Titan Stadium.
        
        The stadium is also used for home games/meets for the Oshkosh high schools; Oshkosh West Wildcats, Oshkosh North Spartans, and Oshkosh Lourdes Knights.''',
        address: "450 Josslyn St, Oshkosh, WI 54902",
        phoneNumber: "(920) 424-1034"),
    Building(
        name: "Tiedmann Field at Alumni Stadium",
        xLoc: 44.02271536649358,
        yLoc: -88.56146608615569,
        type: BuildingType.sport,
        titleImage: "default.png",
        address: "450 Josslyn St, Oshkosh, WI 54902"),
    Building(
      name: "UWO Track and Field Oval",
      xLoc: 44.023731044966254,
      yLoc: -88.56086216318978,
      type: BuildingType.sport,
    ),
    Building(
        name: "UWO Softball Park",
        xLoc: 44.02255432012999,
        yLoc: -88.56440755324519,
        type: BuildingType.sport,
        titleImage: "softball.jpeg",
        address: "450 Josslyn St, Oshkosh, WI 54902"),
    Building(
        name: "Webster Hall",
        xLoc: 44.02498498842422,
        yLoc: -88.55165301391771,
        type: BuildingType.residential,
        titleImage: "webster.jpeg",
        history:
            '''Constructed in 1957, Webster Hall, the second oldest residence hall at UWO, was officially opened as an all-female community. In 1958, the first hall director, or “Dorm Mother,” as she was known, was Mildred M. Henderson, who served dutifully for the first few years. The opening of the hall served two important functions. In addition to serving as a much needed residence hall to accommodate the growing numbers of the Oshkosh State College, the Webster Hall basement served as interim union during the construction of what is now Reeve Union. In the basement, one could enjoy a snack bar and a bookstore, along with recreational activities for students to indulge themselves.
        By 1997, Webster hall was facing low female enrollment, eventually resulting in the combination of the Donner and Webster Hall administrations. The buildings themselves remained separate communities; however, staffing for the buildings was combined. The full time Residence Hall Director lived in Donner Hall while a graduate student was hired to work in Webster as the Assistant Residence Hall Director. Subsequently, by 1999, Webster Hall became a coeducational environment, ending Webster Hall’s 40 year reputation as an all-female residence hall.
        The Donner and Webster Hall community combination allowed for the creation of a single Donner/Webster Hall Government, which began to take charge on “Donster Traditions.” One well-known tradition, beginning in the early 1990s, was an annual Thanksgiving Dinner, held in the Webster Basement. This tradition was discontinued in 2016.''',
        address: "810 High Ave, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1821",
        description: "Currently, a coed dormitory.",
        hours: "M-Sun: 12-6PM"),
    Building(
        name: "Pollock House",
        xLoc: 44.02521326542244,
        yLoc: -88.55130547379636,
        type: BuildingType.services,
        titleImage: "pollock.jpeg",
        history:
            '''The Pollock House was built in 1920 for W.E. Pollock, once the president of the Oshkosh Overall Company, known today as Oshkosh B'Gosh. The house was designed in the Spanish Revival style with a red barrel roof and three chimneys capped with campaniles. Near retirement, Pollock feared for his home’s deterioration and he offered to help the College purchased his property. Approved by the Board of Regents, the Wisconsin State Teacher’s College at Oshkosh gained title to the house on September 29, 1943 through a combination of donated and appropriated funds.
        With the acquisition of the property during World War II, President Forrest R. Polk used the house as a social center for members of the 96th College Detachment, the unit of Army Air Corps cadets training on campus to meet their families and friends. 
        President Polk visualized the house as either a student union or dormitory after the war’s conclusion.  In the end, the Regents and Polk settled on the latter and from 1944-1967 it housed women students.  In 1967, the Pollock House became the headquarters for the newly established School of Nursing. By 1971, the building became knowns as the “Pollock Alumni House” and housed the Alumni Association and Alumni Relations.  The building welcomed alumni and hosted special events for over 40 years until the program moved to the Culver Family Welcome Center.''',
        address: "765 Algoma Blvd., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1402",
        description: "Offices"),
    Building(
        name: "Student Health Center",
        xLoc: 44.025748116673455,
        yLoc: -88.55173210551507,
        type: BuildingType.services,
        titleImage: "healthCenter.jpeg",
        address: "777 Algoma Boulevard, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-2424",
        hours: "M-F: 8AM-4:30PM"),
    Building(
        name: "Radford Hall",
        xLoc: 44.02552428135437,
        yLoc: -88.55146436943217,
        type: BuildingType.services,
        titleImage: "radford.jpeg",
        history:
            '''Built in 1952, Radford Hall was the first new building added since the late 1920s. It was also the first dormitory built by the school and represented a new trend in campus life at Oshkosh.  With a new liberal arts curriculum and more and more students enrolling, the school began to plan for a real residential experience, earlier experiments with dormitories at the Oviatt and Pollock Houses notwithstanding.  After Radford came an almost never ending two decades of newly constructed dormitories, dining halls and recreational facilities.  
        Originally, the Radford dorm provided space for 80 residents, however in 1956, a third floor was added to accommodate more people. A dining room was built into Radford and hallway connecting the building to the Pollock house allowed residents of that house to travel to take their meals without going outside.  No state funds were involved in building Radford Hall as the school used an oft repeated process of having renters through a self-amortizing corporation to service the construction's debt. 
        In 1967, Radford was converted into faculty offices for the English Department and facilities for the campus Health Center. ''',
        address: "777 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-2424",
        hours: "M-F: 8AM-4:30PM",
        description:
            "Presently, Radford Hall comprises English Department offices, the Health Center and computer lab."),
    Building(
        name: "Donner Hall",
        xLoc: 44.025409854223454,
        yLoc: -88.55231078166113,
        type: BuildingType.residential,
        titleImage: "donner.webp",
        history:
            '''In 1962, newly constructed Donner Hall (tied with Breese Hall as the fourth on campus) joined Pollock House, Radford and Webster Halls in what would become a tight community of women-only residences nestled between High St. and Algoma Blvd. In 1970, Donner was the first of the four to become co-educational, with men and women living on alternating floors. Three years later, the University experimented and converted eight of Donner's rooms into four two-bedroom suites, each accommodating three residents.
        Like other dormitories on campus, Donner Hall, had its share of unique events that helped form a sense of community. Starting in 1964, the "Donner Duke Dance" contributed to an already crowded campus royalty by having participants vote on a Duke, Duchess and Dork of the evening. With live music, snacks and drinks in the "Donner Dungeon" basement, the dormitory hosted one of the more ambitious events of all the residence halls.
        Today the hall along with Webster Hall operates as a combined community (known affectionately as "Donster") with a shared hall council and staff serving all residents. ''',
        address: "820 High Ave, Oshkosh, WI 54901",
        phoneNumber: " (920) 424-1829",
        description: "Coed dormitory."),
    Building(
        name: "Clow Social Science Center",
        xLoc: 44.02623677744267,
        yLoc: -88.55294566143436,
        type: BuildingType.educational,
        threeSixtyPhotoName: "clow_social_science_center",
        titleImage: "clow.jpeg",
        history:
            '''Fifteen years after its expansion into liberal arts, the Oshkosh State University was suffering from a great lack of space for instruction and faculty offices. The Clow complex (an instruction facility and office building) almost doubled the number of classrooms on campus. The building’s unique clover-leaf lecture halls provided state-of-the-art communication technology to the campus of 7,000+ students. The tall Clow Faculty building also provided much needed space for departmental offices.  In addition, Clow was the home to the University's first television studio.  A museum on the top floor provided a return to the display of natural and indigenous history specimens and artifacts that did not exist on campus since 1916.  Like that collection, the Clow Museum was destroyed in a fire in 1983.  
        In 2014-2016, the Clow complex underwent a substantial renovation that brought the College of Nursing into the building with its specialized classrooms, laboratories and communal spaces.  This was made possible after the departure of many departments to the new Sage Hall across the street.''',
        address: "805 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description:
            "Houses offices for various Social Science Departments, classrooms, laboratories, an audio-visual center, a television studio, and computer labs."),
    Building(
        name: "College of Education and Human Services",
        xLoc: 44.027142017239534,
        yLoc: -88.55285295037903,
        type: BuildingType.educational,
        threeSixtyPhotoName: "college_of_education_and_human_services",
        titleImage: "COEHS.jpeg",
        address: "817 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-0413"),
    Building(
        name: "Nursing and Education Building",
        xLoc: 44.026664053620735,
        yLoc: -88.55253362476822,
        type: BuildingType.educational,
        threeSixtyPhotoName: "nursing_and_education",
        titleImage: "nursing.jpeg",
        history:
            '''The creation of a separate School of Nursing at the Wisconsin State University-Oshkosh in 1966 came simultaneously with the decision to the supply the program with a new facility of its own.  While unprecedented, this decision was necessary due to the specialized needs of the professional program.  At this time, the School of Education also needed expanded space and their needs were included in the nursing building project early on. This would complicate planning, as the University was using restricted federal grants in building the facility. These grants focused on promoting nursing education contained detailed regulations and requirements that made understanding their application to the planning for non-nursing portions of the building difficult. 
        After the renovation of the Clow Social Science Center in 2016, the College of Nursing moved into this facility.''',
        address: "845 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description: "House classrooms, offices and laboratories."),
    Building(
        name: "Multicuiltural Education Center",
        xLoc: 44.02484052318569,
        yLoc: -88.55060125275415,
        type: BuildingType.services,
        titleImage: "MEC.jpeg",
        history:
            '''The Wall House was built in 1898 for local lumberman and banker Thomas Wall. Like the Oviatt House, local architect William Williams designed the building and combined late Queen Anne and Colonial Revival styles to create the large home. Other similarities include interior artistic decorations by Gustave Behncke and carved fireplaces. Thomas Wall and his wife resided in the home for almost twenty years. The couple sold the house to their daughter, Marion and her husband, Oshkosh businessman Morgan Davies, when they moved to their country house at Windmere, a vacation community on Lake Winnebago. In 1932, Marion and Morgan Davies left the Wall House and rented it to former neighbors John Bartlett, Jr. and his wife. Bartlett grew up across the street in the so-called Albee House and his wife, Katherine Pollock, grew up next door at the Pollock House. By moving into the Wall House, they remained close to their parents, who still occupied their childhood homes. When John and Katherine Bartlett moved to a farm in 1940, Marion Wall sold the home to OSTC instructor, Frederick Caudle when her returned from naval training after WWII to serve, in part, as a counselor at the Veterans Administration Guidance Center and the advisor the campus veterans’ club which used Caudle’s home as meeting place. After his marriage to Dr. Jean Gogolewski, a professor of Education, the home was the frequent site of numerous programs that brought faculty and students together after classes.
        In 1985, the house was placed the National Register of Historic Places. The fate of the Wall House looked dim by the mid-1990s and into the early part of the next century due to its deteriorating state. In 1994, the UW-Oshkosh Campus Physical Development Plan Summary Report said that although the house is of considerable historical and architectural significance, its poor condition suggested it would not last out the century. The Wisconsin Trust for Historic Preservation in 2000 named the house as one of Wisconsin’s 10 most endangered properties. When the University planned to demolish the house for parking purposes due to termite infestation and bad drinking water, the building was home the Multicultural Education Center. Students, staff and community members who protested the idea of demolition formed a group to help save the structure.
        After late 2000, the future of the Wall House looked positive. Chancellor Richard H. Wells announced early in his tenure that the house would be saved through at least 2004. At the time, more than \$488,000 was needed to make the house compliant with the American Disabilities Act. Electrical and exterior maintenance has since taken place.''',
        address: "751 Algoma Blvd., Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1873",
        hours: '''
          M-Th: 9AM-8PM
          Fri: 9AM-4:30PM
          Weekends: Closed
        ''',
        description: "Home of the Multi-Cultural Education Center (MEC)"),
    Building(
        name: "Buckstaff Planetarium",
        xLoc: 44.0284352053685,
        yLoc: -88.55156544438879,
        type: BuildingType.services,
        titleImage: "planetarium.jpeg",
        history:
            '''When it was built in 1963-64 as part of the first part of the Halsey Science Center, the Buckstaff Planetarium was one of several in development or built in the public universities or two-year centers in Wisconsin. The inclusion of the planetarium was not originally part of the early science building project planning, but was later introduced as early as September 1960 in a meeting with the architect. The building was designed by the Oshkosh-based architectural firm of Sandstedt, Knoop and Yarbro and constructed by Ben B. Ganther Company with concrete work done by Badger Concrete. The project's completion was delayed due to some unique aspects of the roof and labor actions at Badger Concrete causing the Planetarium to be the last portion of the original three buildings of the first phase of the Halsey Science Center.  After it opened, the facility was used for both classroom instruction as well as public programming. 
        Originally two planetarium mechanisms were considered, a Goto S-3 and a Spitz A3. Ultimately the school was purchased a Spitz Model A3-P, an upgrade. The projectors required a hanging, perforated aluminum projection dome that was installed by the contractors under the supervision of a Spitz authorized representative. The projection unit and its mounting cabinet was upgraded in 1980 along with a change of seating from standard classroom chairs to recliners.  
        In 2014, the facility was closed due to safety and ADA issues. Repairs and upgrades were put on hold in 2018 due to University financial issues.''',
        address: "800 Algoma Blvd, Oshkosh, WI 54901",
        phoneNumber: "(920) 424-1234",
        description: "Closed in 2014 due to safety issues. Storage"),
    Building(
        name: "Hazardous Waste Storage",
        xLoc: 44.02578174326656,
        yLoc: -88.555036699182,
        type: BuildingType.other,
        threeSixtyPhotoName: "ceramics_lab_and_hazardous_waste_storage",
        phoneNumber: "519-661-2111"),
    Building(
        name: "Ceramics Lab",
        xLoc: 44.02557514688688,
        yLoc: -88.5554884798904,
        type: BuildingType.educational,
        threeSixtyPhotoName: "ceramics_lab_and_hazardous_waste_storage",
        address: "1165 Rockwell Ave., Oshkosh, WI 54901"),
    Building(
      name: "Parking Lot 11",
      xLoc: 44.03052527472049,
      yLoc: -88.55241503107213,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking Lot 27",
      xLoc: 44.02904723640273,
      yLoc: -88.5549722472866,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 4",
      xLoc: 44.029077032965034,
      yLoc: -88.55156329796841,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 4a",
      xLoc: 44.02861148087468,
      yLoc: -88.55268925970867,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 29",
      xLoc: 44.02788233963037,
      yLoc: -88.55337613818782,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 25",
      xLoc: 44.027370808243184,
      yLoc: -88.55369105012696,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 17",
      xLoc: 44.02860941802313,
      yLoc: -88.54969970763467,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 33",
      xLoc: 44.025651554737046,
      yLoc: -88.55561372922745,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 34",
      xLoc: 44.02712118541348,
      yLoc: -88.54800210634097,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 14",
      xLoc: 44.02587581622396,
      yLoc: -88.55227806893726,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 7",
      xLoc: 44.025012203247904,
      yLoc: -88.55347243190877,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 5a",
      xLoc: 44.02417784611225,
      yLoc: -88.55431335524047,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 13",
      xLoc: 44.023524186947824,
      yLoc: -88.55220056018774,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 15",
      xLoc: 44.02414203516439,
      yLoc: -88.54970527611594,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 23",
      xLoc: 44.025505004977006,
      yLoc: -88.54676268509174,
      type: BuildingType.parking,
    ),
    Building(
      name: "High Avenue Parking Ramp",
      xLoc: 44.02294371451474,
      yLoc: -88.54976346947127,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 37",
      xLoc: 44.02350466941373,
      yLoc: -88.54597702941838,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 18",
      xLoc: 44.02233283589201,
      yLoc: -88.54682418670806,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 30",
      xLoc: 44.021347840767014,
      yLoc: -88.54797431446204,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 10",
      xLoc: 44.02181698657909,
      yLoc: -88.54875649515768,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 6",
      xLoc: 44.020722707510814,
      yLoc: -88.54949056897419,
      type: BuildingType.parking,
    ),
    Building(
      name: "Parking lot 39",
      xLoc: 44.01841777114234,
      yLoc: -88.55680221482972,
      type: BuildingType.parking,
    ),
  };

  static Set<Building> updatedBuildingsList = <Building>{};

  static Set<Building> allBuildings() {
    if (updatedBuildingsList.isEmpty) {
      return buildingsList;
    } else {
      return updatedBuildingsList;
    }
  }

  static Future<String?> getBuildingJSON() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(PreferenceKeys.currentCampusDataState);
  }

  static void checkForAndPerformUpdates() {
    if (!updateAvailable()) {
      return;
    }
    String? newBuildingData = getBuildingJSONFromServer();
    if (newBuildingData != null) {
      SharedPreferences.getInstance().then((prefs) => {
        prefs.setString(PreferenceKeys.currentCampusDataState, newBuildingData)
      });
      updatedBuildingsList = createBuildingsFromJSON(newBuildingData);
    }
  }

  static bool updateAvailable() {
    return false;
  }

  static void updateBuildingsFromStorage() {
    Future<String?> theme = getBuildingJSON();
    theme.then((buildingJSON) => {
      if (buildingJSON != null) {
        updatedBuildingsList = createBuildingsFromJSON(buildingJSON)
      }
    });
  }

  //TODO
  static String? getBuildingJSONFromServer() { 
    return "";
  }

  //TODO
  static Set<Building> createBuildingsFromJSON(String json) {
    return <Building>{};
  }

}

