import 'package:google_maps_flutter/google_maps_flutter.dart';

//Name: Building and people class
//Date: 12/14/2022
//Description: A class that contains all the information about a building
//Bugs: None
//Reflection: I think that there may be a better way to store the information
//about a building. I rarely see a class with this many fields- is there a
//better way to approach the problem of a single object containing a large amount
//of unique information?
//Author: Sebastian Amyotte

class Building {
  String name;
  double xLoc;
  double yLoc;
  Marker? marker;
  BuildingType type;
  String history;
  List<People> people;
  List<Service> services;
  String titleImage;
  String hours;
  String description;
  String address;
  String phoneNumber;
  String threeSixtyPhotoName;
  bool isFavorite = false;

  Building({
    required this.name,
    this.titleImage = "default.png",
    this.people = const [],
    this.history = "",
    this.xLoc = 0.0,
    this.yLoc = 0.0,
    this.type = BuildingType.other,
    this.hours = "",
    this.description = "",
    this.address = "",
    this.phoneNumber = "",
    this.services = const [],
    this.threeSixtyPhotoName = "",
  });

  //Sets the marker for the building.
  setMarker(Marker marker) {
    this.marker = marker;
  }
}

//For sorting, searching, and map icon color
enum BuildingType {
  residential,
  educational,
  parking,
  sport,
  services,
  other,
}

//Simple class to hold information about people. Used in the Building class
class People {
  String imageFileNameAndExtension;
  String name;
  String? phoneNumber;
  String? officeAddress;
  String? email;

  People(
    this.name, {
    this.imageFileNameAndExtension = 'default.png',
    this.phoneNumber,
    this.officeAddress,
    this.email,
  });
}

class Service {
  String serviceName;
  String serviceDescription;

  Service(this.serviceName, this.serviceDescription);
}
