import 'dart:convert';

import 'package:lsc/core/model/trip_model/location.dart';

DriverTrip driverTripFromJson(String str) => DriverTrip.fromJson(json.decode(str));

String driverTripToJson(DriverTrip data) => json.encode(data.toJson());

class DriverTrip {
  List<List<Location>> location;
  DateTime startAt;

  DriverTrip({
    required this.location,
    required this.startAt,
  });

  factory DriverTrip.fromJson(Map<String, dynamic> json) => DriverTrip(
    location: List<List<Location>>.from(json["location"].map((x) => List<Location>.from(x.map((x) => Location.fromJson(x))))),
    startAt: DateTime.parse(json["start_at"]),
  );

  Map<String, dynamic> toJson() => {
    "location": List<dynamic>.from(location.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "start_at": startAt.toIso8601String(),
  };
}