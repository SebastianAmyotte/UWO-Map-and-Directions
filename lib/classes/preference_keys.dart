//Name: SharedPreference storage
//Date: 12/14/2022
//Description: This class provides a quick and easy way to reference the keys
//used to store data in the SharedPreference storage
//Bugs: None
//Reflection:
//Author: Primary Author:  Rick Bowman

/*
Name: Rick Bowman
Date: 2022/11/27
Description: This file is used to store all of the SharedPreference keys
  that are used throughout the app
Bugs: None
Reflection: 
*/

// Class used to store the SharedPreference keys
class PreferenceKeys {
  static const appTheme = "appTheme";
  static const defaultTab = "defaultTab";
  static const buildingsToggleList = [
    "showEducationalBuildings",
    "showResidentialBuildings",
    "showSportsLocations",
    "showServiceBuildings",
    "showParkingLocations",
    "showOtherLocations",
    "showFavoriteLocations="
  ];
  static const favoriteBuildingsList = "favoriteBuildingsList";
  static const lastBackupComplete = "lastBackupComplete";
  static const displayMapAsSatellite = "displayMapAsSatellite";
  static const currentCampusDataState = "currentCampusDataState";
}
