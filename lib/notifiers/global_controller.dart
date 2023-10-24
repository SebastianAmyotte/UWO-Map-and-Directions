import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../buildings/building.dart';
import '../classes/preference_keys.dart';
import '../classes/campus_data.dart';
import 'package:gui_only/classes/app_style_properties.dart';
// ignore: depend_on_referenced_packages
import '../settings/theme_preferences.dart';


//Name: Authentication Model
//Date: 12/14/2022
//Description: Authentication model that handles communication with Firebase
//Bugs: None
//Reflection: Passing around pointers to this model is handled through ChangeNotifierProvider.
//I am not certain that I implemented this correctly, but it seems to work. I wish we
//had more time to learn about this during class in a more in-depth manner.
//Author: Primary Author: Sebastian Amyotte

class GlobalControllers extends ChangeNotifier {
  GlobalControllers(this.globalContext);
  BuildContext globalContext;

  FavoritePlacesController favoritePlacesController =
      FavoritePlacesController();
  ThemeNotifier? themeNotifier;

  //Gets a pointer to the themeNotifier, used to change the app theme
  setThemeNotifier(ThemeNotifier themeNotifier) {
    this.themeNotifier = themeNotifier;
  }

  //Returns the favorite places controller
  FavoritePlacesController getFavoritePlacesController() {
    return favoritePlacesController;
  }

  //Displays an asynchronous popup with the given title and button text
  displayPopup(BuildContext context, String title, String buttonText) {
    return showDialog(
      context: context,
      builder: (BuildContext bc) {
        return AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppStyleProperties.uwoshYellow,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child:
                  Text(buttonText, style: const TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }
}

//This class is used to store the user's favorite buildings. Rather than
//constantly reading and writing from the SharedPreferences all over the app,
//this class contains the code to do so in one place. Abstraction!
class FavoritePlacesController {
  List<Building> favoritePlaces = [];

  FavoritePlacesController() {
    loadBuildingsFromPreferences();
  }

  //Adds a building to the list of favorite buildings
  addBuildingToPlaces(Building buildingToAdd) {
    favoritePlaces.add(buildingToAdd);
    updatePreferences();
  }

  //Removes a building from the list of favorite buildings
  removeBuildingFromFavorites(Building buildingToRemove) {
    favoritePlaces.remove(buildingToRemove);
    updatePreferences();
  }

  //Toggles a building's favorite status
  toggleBuildingInFavorites(Building buildingToToggle) {
    if (favoritePlaces.contains(buildingToToggle)) {
      favoritePlaces.remove(buildingToToggle);
    } else {
      favoritePlaces.add(buildingToToggle);
    }
    updatePreferences();
  }

  //Returns the full list of favorite buildings
  List<Building> getFavoriteBuildings() {
    return favoritePlaces;
  }

  //Saves the current set of favorite buildings to SharedPreferences storage
  updatePreferences() {
    List<String> stringListOfFavoriteBuildings = [];
    for (Building building in favoritePlaces) {
      stringListOfFavoriteBuildings.add(building.name);
    }
    SharedPreferences.getInstance().then((prefs) {
      prefs.setStringList(
          PreferenceKeys.favoriteBuildingsList, stringListOfFavoriteBuildings);
    });
  }

  //Loads the current set of favorite buildings from SharedPreferences storage
  loadBuildingsFromPreferences() {
    SharedPreferences.getInstance().then((prefs) {
      List<String> stringListOfFavoriteBuildings =
          prefs.getStringList(PreferenceKeys.favoriteBuildingsList) ?? [];
      for (String buildingName in stringListOfFavoriteBuildings) {
        Building? building = findBuildingByName(buildingName);
        if (building != null) {
          favoritePlaces.add(building);
        }
      }
    });
  }

  //Finds a matching building object by its name
  //Note: Returns null if no match is found
  Building? findBuildingByName(String name) {
    for (Building building in Buildings.allBuildings()) {
      if (building.name == name) {
        return building;
      }
    }
    return null;
  }
}

// ChangeNotifier for theme changes across the app
class ThemeNotifier with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  // Set the theme and notify listeners that it has changed
  set darkTheme(bool value) {
    _darkTheme = value;
    themePreference.setTheme(value);
    notifyListeners();
  }
}
