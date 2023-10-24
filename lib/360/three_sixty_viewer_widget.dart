import 'package:flutter/material.dart';
import 'package:gui_only/classes/app_style_properties.dart';
import 'package:panorama/panorama.dart';
import '../classes/campus_data.dart';
import 'package:gui_only/buildings/building.dart';
import 'package:gui_only/notifiers/global_controller.dart';

// ignore: must_be_immutable
class ThreeDViewerWidget extends StatefulWidget {
  ThreeDViewerWidget(this.authModel, {super.key, this.buildingToShow = ""});
  GlobalControllers authModel;
  String buildingToShow;
  @override
  State<ThreeDViewerWidget> createState() =>
      // ignore: no_logic_in_create_state
      _ThreeDViewerWidgetState(buildingToShow);
}

class _ThreeDViewerWidgetState extends State<ThreeDViewerWidget> {
  _ThreeDViewerWidgetState(this.currentImage);
  String fileFormat = '.jpg';
  String fileLocation = 'assets/images/threesixty images/';
  String currentImage;
  //Current and default image
  var scaffoldKey = GlobalKey<ScaffoldState>(); //For showing the search menu
  var searchController = TextEditingController();
  String searchQuery = "";

  //Scaffold containing a panorama widget and a search button
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(children: buildingTiles()),
      ),
      //If the user was brought here by clicking on a building, show a back button
      floatingActionButton: widget.buildingToShow == ""
          ? FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                scaffoldKey.currentState?.openDrawer();
              },
              child: const Icon(Icons.search),
            )
          : FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_sharp),
            ),
      body: Panorama(
          child: Image(
        image: AssetImage(fileLocation +
            (currentImage == "" ? "A&C" : currentImage) +
            fileFormat),
      )),
    );
  }

  //Widget for a list of buildings that contain 360 images
  List<Widget> buildingTiles() {
    List<Widget> buildingWidgets = [];
    buildingWidgets.add(ListTile(
      leading: const Icon(
        Icons.search,
        size: AppStyleProperties.iconSize,
      ),
      title: TextField(
        onChanged: _searchBuilding,
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: AppStyleProperties.fontSize18,
            fontStyle: FontStyle.italic,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                searchQuery = "";
                searchController.clear();
              });
            },
            icon: const Icon(
              Icons.clear,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    ));
    //Get all buildings
    List<Building> buildingsList = Buildings.allBuildings().where((building) {
      return building.threeSixtyPhotoName != "";
    }).toList();
    //Check for search, and perform it by filtering the list of buildings
    if (searchQuery != "") {
      buildingsList = buildingsList.where((Building building) {
        return (building.name
            .toLowerCase()
            .contains(searchQuery.toLowerCase()));
      }).toList();
    }
    //Sort buildings a->z
    buildingsList.sort(((a, b) => (a.name.compareTo(b.name))));
    int numberOfFavoriteBuildingsFound = 0;
    //Get the list of favorite buildings
    FavoritePlacesController favoritePlacesController =
        widget.authModel.getFavoritePlacesController();
    List<Building> favoriteBuildingsList =
        favoritePlacesController.getFavoriteBuildings();

    for (var building in buildingsList) {
      buildingWidgets.insert(
          //If the building is a favorite building, insert it at the top of the list
          favoriteBuildingsList.contains(building)
              ? 1 + numberOfFavoriteBuildingsFound++
              : buildingWidgets.length,
          ListTile(
            onTap: () {
              setState(() {
                currentImage = building.threeSixtyPhotoName;
              });
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.pop(context);
            },
            leading: IconButton(
              icon: favoriteBuildingsList.contains(building)
                  ? const Icon(Icons.star,
                      color: AppStyleProperties.uwoshYellow)
                  : const Icon(
                      Icons.star_border,
                    ),
              onPressed: () {
                setState(() {
                  favoritePlacesController.toggleBuildingInFavorites(building);
                });
              },
            ),
            title: Text(building.name),
            trailing: const Icon(Icons.arrow_forward_ios),
          ));
    }
    return buildingWidgets;
  }

  //Updates the state when the user types in the search bar
  _searchBuilding(String searchQuery) {
    setState(() {
      this.searchQuery = searchQuery;
    });
  }
}
