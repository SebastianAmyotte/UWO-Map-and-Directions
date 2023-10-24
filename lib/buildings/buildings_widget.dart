import 'package:flutter/material.dart';
import '../classes/campus_data.dart';
import '../classes/app_style_properties.dart';
import 'building.dart';
import 'building_info_widget.dart';
import 'package:gui_only/notifiers/global_controller.dart';

//Name: Buildings Widget
//Date: 12/14/2022
//Description: A list of buildings that can be searched, favorited and filtered
//Bugs: None
//Reflection: I like that the list of pages are alphabetical. I think that
//having a way to change the order could be a good addition here. I also think
//a button to filter by building type may be helpful. I did not implement this
//due to a fear of feature creep and UI bloat.
//Author: Primary Author: Summer Ruff.
//Secondary: Sebastian Amyotte, Search bar / favorites
//Rick Bowman Some refactoring / Dark mode support

// ignore: must_be_immutable
class BuildingsWidget extends StatefulWidget {
  BuildingsWidget(this.authModel, {super.key});

  GlobalControllers authModel;

  @override
  State<BuildingsWidget> createState() => _BuildingsWidgetState();
}

class _BuildingsWidgetState extends State<BuildingsWidget> {
  var searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: _createBuildingWidgets()),
    );
  }

  //Returns a list of listtiles that contain information about each building, as
  //well as a leading search widget
  List<Widget> _createBuildingWidgets() {
    //Get favorite places
    FavoritePlacesController favoritePlacesController =
        widget.authModel.getFavoritePlacesController();
    List<Building> favoriteBuildingsList =
        favoritePlacesController.getFavoriteBuildings();
    //Create list of building list tiles
    List<Widget> buildingWidgets = [];
    //Add search widget
    buildingWidgets.add(ListTile(
      leading: const Icon(
        Icons.search,
        size: AppStyleProperties.iconSize,
      ),
      title: TextField(
        onChanged: _searchBuilding,
        controller: searchController,
        decoration: InputDecoration(
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
          hintText: 'Search',
          hintStyle: const TextStyle(
            fontSize: AppStyleProperties.fontSize18,
            fontStyle: FontStyle.italic,
          ),
          border: InputBorder.none,
        ),
      ),
    ));
    //Get all buildings
    List<Building> buildingsList = Buildings.allBuildings().toList();
    //Check for if a search exists, and perform it
    if (searchQuery != "") {
      buildingsList = buildingsList.where((Building building) {
        return building.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
    //Sort buildings alphabetically
    buildingsList.sort(((a, b) => (a.name.compareTo(b.name))));
    int numberOfFavoriteBuildingsFound = 0;
    for (Building building in buildingsList) {
      //If the building is in favorites, add it to the top of the list instead
      buildingWidgets.insert(
        favoriteBuildingsList.contains(building)
            ? 1 + numberOfFavoriteBuildingsFound++
            : buildingWidgets.length,
        ListTile(
          title: Text(building.name),
          trailing: IconButton(
            icon: favoriteBuildingsList.contains(building)
                ? const Icon(Icons.star, color: AppStyleProperties.uwoshYellow)
                : const Icon(
                    Icons.star_border,
                  ),
            onPressed: () {
              setState(() {
                favoritePlacesController.toggleBuildingInFavorites(building);
              });
            },
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BuildingInfoWidget(
                  widget.authModel,
                  building: building,
                ),
              ),
            );
          },
        ),
      );
    }
    return buildingWidgets;
  }

  //Set state when the search query changes
  _searchBuilding(String searchQuery) {
    setState(() {
      this.searchQuery = searchQuery;
    });
  }
}
