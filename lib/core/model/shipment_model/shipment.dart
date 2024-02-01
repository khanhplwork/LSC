import 'dart:convert';

import 'package:lsc/core/model/shipment_model/shipment_data.dart';


Shipment shipmentFromJson(String str) => Shipment.fromJson(json.decode(str));

String shipmentToJson(Shipment data) => json.encode(data.toJson());

class Shipment {
    List<ShipmentData> data;
    int totalPages;
    int currentPage;
    int perPage;

    Shipment({
        required this.data,
        required this.totalPages,
        required this.currentPage,
        required this.perPage,
    });

    factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        data: List<ShipmentData>.from(json["data"].map((x) => ShipmentData.fromJson(x))),
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        perPage: json["per_page"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total_pages": totalPages,
        "current_page": currentPage,
        "per_page": perPage,
    };
}