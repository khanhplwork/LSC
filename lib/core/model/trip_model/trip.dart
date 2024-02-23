import 'dart:convert';

import 'package:lsc/core/model/trip_model/location.dart';

DriverTrip driverTripFromJson(String str) =>
    DriverTrip.fromJson(json.decode(str));

String driverTripToJson(DriverTrip data) => json.encode(data.toJson());

class DriverTrip {
  List<List<Location>> location;
  String startAt;

  DriverTrip({
    required this.location,
    required this.startAt,
  });

  factory DriverTrip.fromJson(Map<String, dynamic> json) => DriverTrip(
        location: List<List<Location>>.from(json["location"].map(
            (x) => List<Location>.from(x.map((x) => Location.fromJson(x))))),
        startAt: json["start_at"],
      );
  factory DriverTrip.fromMap(Map<dynamic, dynamic> json) => DriverTrip(
        location: loadLocation(json['location']),
        startAt: json["start_at"],
      );

  Map<String, dynamic> toJson() => {
        "location": List<dynamic>.from(
            location.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "start_at": startAt,
      };

  void addNewListLocation(List<Location> locations) {
    location.add(locations);
  }

  void updateListLocation(List<Location> locations) {
    location[location.length - 1] = locations;
  }
}

List<List<Location>> loadLocation(dynamic locationRes) {
  List<List<Location>> locations = [];
  for (dynamic liveLocation in locationRes) {
    List<Location> temp = [];
    for (int i = 0; i < liveLocation.length; i++) {
      if (i == 0) {
        temp = [];
        temp.add(Location(
            latitude: liveLocation[i]["latitude"],
            longitude: liveLocation[i]["longitude"]));
      } else {
        temp.add(Location(
            latitude: liveLocation[i]["latitude"],
            longitude: liveLocation[i]["longitude"]));
      }
    }
    locations.add(temp);
  }
  return locations;
}
