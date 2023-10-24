import 'package:flutter/material.dart';
import 'package:gui_only/classes/app_style_properties.dart';
import 'package:gui_only/buildings/building.dart';
import '../map/places_widget.dart';
import 'package:flutter/services.dart';
import '../notifiers/global_controller.dart';
import '../360/three_sixty_viewer_widget.dart';

//Name: Building info widget
//Date: 12/14/2022
//Description: A large widget, when provided with a building, displays all the
//information about that building. This includes a description, hours, address,
//phone number, and buttons to view the building on the map, view a 360 photo of
//the building, and view the building's occupants. This widget only displays
//information that is available for the building. Missing information is not
//displayed.
//Bugs: None
//Reflection: This page is visually quite busy. Some buildings have a long history
//and can be quite long. Condensing the information into a smaller vertical height
//could be preferable
//Author: Sebastian Amyotte

// ignore: must_be_immutable
class BuildingInfoWidget extends StatefulWidget {
  BuildingInfoWidget(this.authModel, {super.key, required this.building});

  GlobalControllers authModel;
  final Building building;

  @override
  State<BuildingInfoWidget> createState() => _BuildingInfoWidgetState();
}

class _BuildingInfoWidgetState extends State<BuildingInfoWidget> {
  var searchController = TextEditingController();
  String searchQuery = "";

  //An app bar that displays the building's name, body contains
  //information about the building from placeinformation()
  @override
  Widget build(BuildContext context) {
    Building building = widget.building;
    return Scaffold(
      appBar: AppBar(
        title: Text(building.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: placeInformation(building),
        ),
      ),
    );
  }

  //Returns a list of widgets containing information about the building
  //Does a check at each data point to see if it is available, if not, it is not
  //added to the list. This is done to avoid displaying empty data points
  List<Widget> placeInformation(Building building) {
    List<Widget> placeInformation = [];
    //Add image
    placeInformation.add(
      Image(
        alignment: Alignment.center,
        image:
            AssetImage('assets/images/building images/${building.titleImage}'),
      ),
    );
    placeInformation.add(divider());
    //Add brief description
    if (building.description != "") {
      placeInformation.add(defaultPadding(Text(building.description)));
      placeInformation.add(divider());
    }

    //Hours
    if (building.hours != "") {
      placeInformation.add(copyToClipBoardListTile("Hours", building.hours));
      placeInformation.add(divider());
    }

    //Address
    if (building.address != "") {
      placeInformation
          .add(copyToClipBoardListTile("Address", building.address));
      placeInformation.add(divider());
    }

    //Phone number
    if (building.phoneNumber != "") {
      placeInformation.add(
          copyToClipBoardListTile("Contact information", building.phoneNumber));
      placeInformation.add(divider());
    }
    bool photo360Missing = building.threeSixtyPhotoName == "";
    //Add buttons
    placeInformation.add(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppStyleProperties.uwoshYellow),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text("Directions to ${building.name}"),
                      centerTitle: true,
                    ),
                    body: PlacesWidget(
                      widget.authModel,
                      directionsToBuilding: building,
                    ),
                  ),
                ),
              );
            },
            child: const Text(
              "Directions",
              style: TextStyle(color: Colors.black),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: photo360Missing
                    ? Colors.grey
                    : AppStyleProperties.uwoshYellow),
            onPressed: photo360Missing
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                            appBar: AppBar(
                              backgroundColor: Colors.grey,
                              title: Text("${building.name} entrance"),
                              centerTitle: true,
                            ),
                            body: ThreeDViewerWidget(
                              widget.authModel,
                              buildingToShow: building.threeSixtyPhotoName,
                            )),
                      ),
                    );
                  },
            child: Text(photo360Missing ? "No 360 photo" : "View 360 Photo",
                style: const TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
    placeInformation.add(divider());

    //Services
    if (building.services.isNotEmpty) {
      placeInformation.add(defaultPadding(Text(
        "Services",
        style: titleFontSize(),
      )));
      for (Service service in building.services) {
        placeInformation.add(defaultPadding(Text(service.serviceName)));
        placeInformation.add(defaultPadding(Text(service.serviceDescription)));
      }
      placeInformation.add(divider());
    }

    //People have been removed from the app, for privacy reasons
    // if (building.people.isNotEmpty) {
    //   //Search box
    //   placeInformation.add(
    //     defaultPadding(
    //       Text(
    //         "People in this building",
    //         style: titleFontSize(),
    //       ),
    //     ),
    //   );
    //   placeInformation.add(
    //     Padding(
    //       padding: const EdgeInsets.only(left: 10, top: 10, right: 25),
    //       child: Container(
    //         decoration: BoxDecoration(
    //           borderRadius: const BorderRadius.all(Radius.circular(7.5)),
    //           color: const Color.fromARGB(255, 207, 207, 207),
    //           border: Border.all(color: Colors.black),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 5),
    //           child: TextField(
    //             onChanged: _searchPerson,
    //             controller: searchController,
    //             decoration: InputDecoration(
    //               focusedBorder: InputBorder.none,
    //               suffixIcon: IconButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     searchQuery = "";
    //                     searchController.clear();
    //                   });
    //                 },
    //                 icon: const Icon(
    //                   Icons.clear,
    //                   color: Colors.black,
    //                 ),
    //                 color: Colors.black,
    //               ),
    //               hintText: 'Search',
    //               hintStyle: const TextStyle(
    //                 color: Colors.black,
    //                 fontSize: AppStyleProperties.fontSize18,
    //                 fontStyle: FontStyle.italic,
    //               ),
    //             ),
    //             style: const TextStyle(
    //               color: Colors.black,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    //   placeInformation.add(defaultPadding(personWrapBuilder(building)));
    //   placeInformation.add(divider());
    // }

    //History
    if (building.history != "") {
      placeInformation.add(
        defaultPadding(
          Text(
            "History",
            style: titleFontSize(),
          ),
        ),
      );
      placeInformation.add(
        defaultPadding(
          Text(
            building.history,
            textAlign: TextAlign.left,
          ),
        ),
      );
      placeInformation.add(divider());
    }
    return placeInformation;
  }

  //Updates the state when the search query changes
  _searchPerson(String searchQuery) {
    setState(() {
      this.searchQuery = searchQuery;
    });
  }

  //Consisent padding for the page
  Padding defaultPadding(Widget child) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: child,
    );
  }

  //A widget that contains information about a person
  //Including their name and image. Only shows information that is present
  //for that person.
  Wrap personWrapBuilder(Building building) {
    List<Widget> peopleWidget = [];
    //Get all people, filter out anyone not in the search results
    for (People person in building.people.where((person) {
      return person.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          searchQuery == "";
    })) {
      List<Widget> onePersonWidget = [];
      onePersonWidget.add(
        //Name
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.center,
            person.name,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      );
      //Image
      onePersonWidget.add(ClipRRect(
        borderRadius: BorderRadius.circular(7.5),
        child: Image(
            fit: BoxFit.cover,
            width: 100,
            height: 125,
            image: AssetImage(
                'assets/images/people images/${person.imageFileNameAndExtension}')),
      ));
      //Address
      if (person.officeAddress != null) {
        onePersonWidget.add(
            defaultPadding(copyToClipboardTextWidget(person.officeAddress!)));
      }
      //Phone num
      if (person.phoneNumber != null) {
        onePersonWidget.add(
            defaultPadding(copyToClipboardTextWidget(person.phoneNumber!)));
      }
      //Email
      if (person.email != null) {
        onePersonWidget
            .add(defaultPadding(copyToClipboardTextWidget(person.email!)));
      }
      //Add the person to the list of people
      peopleWidget.add(
        Container(
          width: 175,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7.5)),
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            children: onePersonWidget,
          ),
        ),
      );
    }
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: peopleWidget,
    );
  }

  //Consistent text style for the page
  TextStyle titleFontSize() {
    return const TextStyle(fontSize: 24);
  }

  //Consistent divider for the page
  divider() {
    return const Divider(
      thickness: 3,
      indent: 25,
      endIndent: 25,
    );
  }

  //A widget that displays a list tile that when tapped, copies the text to the clipboard
  Widget copyToClipBoardListTile(String title, String subtitle) {
    return GestureDetector(
        onTapUp: (tapUpDetails) async {
          Clipboard.setData(ClipboardData(text: subtitle));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppStyleProperties.uwoshYellow,
            content: Text(
              "Copied $subtitle to the clipboard",
              style: const TextStyle(color: Colors.black),
            ),
            duration: const Duration(seconds: 1),
          ));
        },
        child: ListTile(
          title: Text(
            title,
            style: titleFontSize(),
          ),
          subtitle: defaultPadding(Text(subtitle)),
        ));
  }

  //A widget that displays text. When tapped, copies the text to the clipboard
  Widget copyToClipboardTextWidget(String content) {
    return GestureDetector(
      onTapUp: (tapUpDetails) async {
        Clipboard.setData(ClipboardData(text: content));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppStyleProperties.uwoshYellow,
            content: Text(
              "Copied $content to the clipboard",
              style: const TextStyle(color: Colors.black),
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Text(
        content,
      ),
    );
  }
}
