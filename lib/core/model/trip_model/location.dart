class Location {
    double latitude;
    double longtitude;

    Location({
        required this.latitude,
        required this.longtitude,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longtitude: json["longtitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longtitude": longtitude,
    };
}