import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gui_only/classes/app_style_properties.dart';
import '../buildings/building.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';
import '../classes/campus_data.dart';
import '../classes/preference_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notifiers/global_controller.dart';
import 'google_maps_themes.dart';

//Name: Places/Map widget
//Date: 12/14/2022
//Description: This is a widget that contains a Google map widget and a
//set of markers to find directions.
//Bugs: None
//Reflection: I want to refactor this class. But the specific packages and
//references I need access to would require a lot of pointing back and forth.
//It would be better to completely restart this class.
//Author: Primary Author: Sebastian Amyotte

// ignore: must_be_immutable
class PlacesWidget extends StatefulWidget {
  final Building? directionsToBuilding;
  GlobalControllers authModel;

  PlacesWidget(this.authModel, {super.key, this.directionsToBuilding}) {
    checkLocationPermissions();
  }

  //Checks if the user has granted location permissions
  //If not, it will request them
  checkLocationPermissions() async {
    Location location = Location();
    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  @override
  State<PlacesWidget> createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  GoogleMapController? mapController;
  final LatLng _center =
      LatLng(Buildings.xLoc, Buildings.yLoc); //UWO coordinates
  Set<Marker> markerList = {};
  Set<Polyline> navigationRoute = {};
  bool darkMode = false; //Will be replaced by global listener
  bool showTerrain = false;
  double? phoneLat; //Users current latitude
  double? phoneLong; //Users current longitude
  double zoom = Buildings.zoom; //Zoomed in to cover school area
  double compassAngle =
      Buildings.compassAngle; //Rotated so that campus is straight
  var scaffoldKey =
      GlobalKey<ScaffoldState>(); //For showing the visibility menu
  var searchController = TextEditingController();
  String searchQuery = "";
  List<bool> markerVisibilityCheckboxToggles = [
    true, //Educational;
    true, //Residential;
    true, //Sports;
    true, //Service;
    false, //Parking;
    false, //Other;
    true, //Favorites;
  ];

  @override
  Widget build(BuildContext context) {
    //Load the terrain toggle from shared preferences
    SharedPreferences.getInstance().then((prefs) {
      showTerrain =
          prefs.getBool(PreferenceKeys.displayMapAsSatellite) ?? false;
    });
    //Load the visibility preferences from the shared preferences
    SharedPreferences.getInstance().then((prefs) {
      for (int i = 0; i < PreferenceKeys.buildingsToggleList.length; i++) {
        markerVisibilityCheckboxToggles[i] =
            prefs.getBool(PreferenceKeys.buildingsToggleList[i]) ?? true;
      }
    });
    markerList = visibleMarkers();
    //If there was a building provided in the constructor, and navigational
    //route information hasn't been calculated, go calculate it!
    if (widget.directionsToBuilding != null && navigationRoute.isEmpty) {
      directions(to: widget.directionsToBuilding!);
    }
    markerList.add(
      const Marker(
          markerId: MarkerId("Surprise"),
          infoWindow:
              InfoWindow(title: "Surprise!", snippet: "You found me :)"),
          position: LatLng(-33.7394, 151.1022)),
    );
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: ListView(children: buildingTiles()),
      ),
      endDrawer: Drawer(
        child: visibilityMenu(),
      ),
      body: GoogleMap(
        compassEnabled: false,
        mapToolbarEnabled: false,
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        buildingsEnabled: true,
        mapType: showTerrain ? MapType.hybrid : MapType.normal,
        polylines: navigationRoute,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          mapController!.setMapStyle(TerrainStyles.darkModeJSON());
        },
        markers: markerList,
        initialCameraPosition: CameraPosition(
          bearing: compassAngle,
          target: _center,
          zoom: zoom,
        ),
      ),
      floatingActionButton: Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              heroTag: null,
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: const Icon(Icons.search),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              heroTag: null,
              onPressed: _returnToSchool,
              child: const Icon(Icons.home),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12.0),
            child: FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              heroTag: null,
              onPressed: _terrainTypeToggle,
              child: Icon(showTerrain
                  ? Icons.layers_outlined
                  : Icons.layers_clear_outlined),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 0.0),
            child: FloatingActionButton(
              backgroundColor: AppStyleProperties.uwoshYellow,
              heroTag: null,
              onPressed: () {
                scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(Icons.pin_drop),
            ),
          ),
        ],
      ),
    );
  }

  //Returns a color based on the building type
  double markerColor(BuildingType type) {
    switch (type) {
      case BuildingType.educational:
        return 100;
      case BuildingType.other:
        return 150;
      case BuildingType.parking:
        return 200;
      case BuildingType.residential:
        return 250;
      case BuildingType.services:
        return 300;
      case BuildingType.sport:
        return 350;
      default:
        return 300;
    }
  }

  //Returns a list of buildings. Favorited buildings appear first
  //Alphabetically sorted
  List<Widget> buildingTiles() {
    List<Widget> buildingWidgets = [];
    buildingWidgets.add(ListTile(
      leading: const Icon(
        Icons.search,
        color: Colors.black,
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
    List<Building> buildingsList = Buildings.allBuildings().toList();
    //Check for search, and perform it
    if (searchQuery != "") {
      buildingsList = buildingsList.where((Building building) {
        return building.name.toLowerCase().contains(searchQuery.toLowerCase());
      }).toList();
    }
    //Sort buildings
    buildingsList.sort(((a, b) => (a.name.compareTo(b.name))));

    int numberOfFavoriteBuildingsFound = 0;
    List<Building> favoriteBuildingsList =
        widget.authModel.getFavoritePlacesController().getFavoriteBuildings();
    for (var building in buildingsList) {
      //Add favorite buildings to the top of the list
      var isFavorite = favoriteBuildingsList.contains(building);
      buildingWidgets.insert(
        isFavorite
            ? 1 + numberOfFavoriteBuildingsFound++
            : buildingWidgets.length,
        ListTile(
          onTap: () {
            directions(to: building);
            if (mapIsReady()) {
              mapController!.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(building.xLoc, building.yLoc),
                    zoom: 18.0,
                    bearing: compassAngle,
                    tilt: showTerrain ? 0.0 : 45.0,
                  ),
                ),
              );
            }

            Navigator.pop(context);
          },
          title: Text(building.name),
          leading: isFavorite
              ? const Icon(Icons.star, color: AppStyleProperties.uwoshYellow)
              : null,
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      );
    }
    return buildingWidgets;
  }

  //Set the state when the search query changes
  _searchBuilding(String searchQuery) {
    setState(() {
      this.searchQuery = searchQuery;
    });
  }

  //A list of building types, and their corresponding marker color
  //Used to toggle the visibility of markers by building type
  ListView visibilityMenu() {
    return ListView(children: [
      Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppStyleProperties.padding8),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppStyleProperties.uwoshYellow),
                onPressed: () {
                  setState(() {
                    for (int i = 0;
                        i < markerVisibilityCheckboxToggles.length;
                        i++) {
                      _setVisibilityOfMarkerInPreferences(i, true);
                      markerVisibilityCheckboxToggles[i] = true;
                    }
                  });
                },
                child: const Text(
                  "Show all",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppStyleProperties.padding8),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: AppStyleProperties.uwoshYellow),
                onPressed: () {
                  setState(() {
                    for (int i = 0;
                        i < markerVisibilityCheckboxToggles.length;
                        i++) {
                      _setVisibilityOfMarkerInPreferences(i, false);
                      markerVisibilityCheckboxToggles[i] = false;
                    }
                  });
                },
                child: const Text("Hide all",
                    style: TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(0);
        },
        leading: Icon(
          Icons.pin_drop,
          color:
              HSVColor.fromAHSV(1, markerColor(BuildingType.educational), 1, 1)
                  .toColor(),
        ),
        title: const Text("Show educational buildings"),
        trailing: Icon(markerVisibilityCheckboxToggles[0]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(1);
        },
        leading: Icon(
          Icons.pin_drop,
          color:
              HSVColor.fromAHSV(1, markerColor(BuildingType.residential), 1, 1)
                  .toColor(),
        ),
        title: const Text("Show residential buildings"),
        trailing: Icon(markerVisibilityCheckboxToggles[1]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(2);
        },
        leading: Icon(
          Icons.pin_drop,
          color: HSVColor.fromAHSV(1, markerColor(BuildingType.sport), 1, 1)
              .toColor(),
        ),
        title: const Text("Show sports locations"),
        trailing: Icon(markerVisibilityCheckboxToggles[2]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(3);
        },
        leading: Icon(
          Icons.pin_drop,
          color: HSVColor.fromAHSV(1, markerColor(BuildingType.services), 1, 1)
              .toColor(),
        ),
        title: const Text("Show service buildings"),
        trailing: Icon(markerVisibilityCheckboxToggles[3]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(4);
        },
        leading: Icon(
          Icons.pin_drop,
          color: HSVColor.fromAHSV(1, markerColor(BuildingType.parking), 1, 1)
              .toColor(),
        ),
        title: const Text("Show parking locations"),
        trailing: Icon(markerVisibilityCheckboxToggles[4]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(5);
        },
        leading: Icon(
          Icons.pin_drop,
          color: HSVColor.fromAHSV(1, markerColor(BuildingType.other), 1, 1)
              .toColor(),
        ),
        title: const Text("Show other locations"),
        trailing: Icon(markerVisibilityCheckboxToggles[5]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
      ListTile(
        onTap: () {
          _toggleVisibilityHandler(6);
        },
        //Star with uw preference color
        leading: const Icon(
          Icons.star,
          color: AppStyleProperties.uwoshYellow,
        ),
        title: const Text("Show favorite locations"),
        trailing: Icon(markerVisibilityCheckboxToggles[6]
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank),
      ),
    ]);
  }

  //Turns a marker on or off
  _toggleVisibilityHandler(int toggled) {
    _setVisibilityOfMarkerInPreferences(
        toggled, !markerVisibilityCheckboxToggles[toggled]);
    setState(() {
      markerVisibilityCheckboxToggles[toggled] =
          !markerVisibilityCheckboxToggles[toggled];
      markerList = visibleMarkers();
    });
  }

  //Sets the visibility of a marker in the preferences, saving it's setting
  //through app restarts
  void _setVisibilityOfMarkerInPreferences(int markerToggled, bool toggledTo) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(
          PreferenceKeys.buildingsToggleList[markerToggled], toggledTo);
    });
  }

  //Returns a list of all the markers that are currently visible
  Set<Marker> visibleMarkers() {
    Set<Marker> shownMarkers = {};
    for (Building building in Buildings.allBuildings()) {
      if (locationIsVisible(building)) {
        Marker buildingMarker = Marker(
          markerId: MarkerId(building.name),
          position: LatLng(building.xLoc, building.yLoc),
          infoWindow: InfoWindow(
            title: building.name,
            snippet: "Tap here for directions",
            onTap: () {
              directions(to: building);
            },
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            markerColor(building.type),
          ),
        );
        shownMarkers.add(buildingMarker);
      }
    }
    return shownMarkers;
  }

  //Takes in a building, and returns true if it's marker should be shown on the map
  bool locationIsVisible(Building building) {
    //First check if the location is favorited, and favorites are shown
    List<Building> favoriteBuildings =
        widget.authModel.getFavoritePlacesController().getFavoriteBuildings();
    if (markerVisibilityCheckboxToggles[6] &&
        favoriteBuildings.contains(building)) {
      return true;
    }
    // Otherwise, check if the building type is toggled on
    switch (building.type) {
      case BuildingType.educational:
        return markerVisibilityCheckboxToggles[0];
      case BuildingType.residential:
        return markerVisibilityCheckboxToggles[1];
      case BuildingType.sport:
        return markerVisibilityCheckboxToggles[2];
      case BuildingType.services:
        return markerVisibilityCheckboxToggles[3];
      case BuildingType.parking:
        return markerVisibilityCheckboxToggles[4];
      case BuildingType.other:
        return markerVisibilityCheckboxToggles[5];
      default:
        return true;
    }
  }

  //Toggles the map between satellite and terrain view
  _terrainTypeToggle() {
    setState(() {
      showTerrain = !showTerrain;
    });
    //Update preferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(PreferenceKeys.displayMapAsSatellite, showTerrain);
    });
  }

  //Returns the camera position to the center of campus
  _returnToSchool() {
    if (mapIsReady()) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: _center, zoom: zoom, bearing: compassAngle)));
    }
  }

  //Checks if the map is ready to be used. Prevents null pointer exceptions
  mapIsReady() {
    return mapController != null;
  }

  //Author: https://blog.codemagic.io/creating-a-route-calculator-using-google-maps/
  //Implemented by Sebastian
  //Calculates a route from A to B. Drawing a red line on the map between the
  //two locations
  //A is the current location of the user, B is the building they want to go to
  directions({required Building to}) async {
    await getCurrentLocation();
    if (phoneLat == null || phoneLong == null) {
      //Couldn't get location
      return;
    }
    List<LatLng> polylineCoordinates = [];
    Map<PolylineId, Polyline> polylines = {};
    PolylinePoints polylinePoints = PolylinePoints();
    double startLatitude = phoneLat!;
    double startLongitude = phoneLong!;
    double destinationLatitude = to.xLoc;
    double destinationLongitude = to.yLoc;
    PolylineResult result = await polylinePoints
        .getRouteBetweenCoordinates(
      "", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    )
        // ignore: body_might_complete_normally_catch_error
        .catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppStyleProperties.uwoshYellow,
          content: Text(
            "Error finding directions: $error",
            style: const TextStyle(color: Colors.black),
          ),
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 140),
          behavior: SnackBarBehavior.floating));
    });

    if (result.status != "OK") {}
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    }

    // Defining an ID
    PolylineId id = const PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    // Adding the polyline to the map
    polylines[id] = polyline;
    setState(() {
      navigationRoute = Set<Polyline>.of(polylines.values);
    });
  }

  //Get's the current location of the user
  getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((locationData) {
      phoneLat = locationData.latitude;
      phoneLong = locationData.longitude;
    });
  }
}
