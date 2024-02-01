import 'dart:convert';

ControlPanel controlPanelFromJson(String str) =>
    ControlPanel.fromJson(json.decode(str));

String controlPanelToJson(ControlPanel data) => json.encode(data.toJson());

class ControlPanel {
  int shipments;
  int shipmentsDelivered;
  int consolidated;
  int assignedPickup;
  int rejectedPickup;
  int pickupCanceled;
  int pickupDelivered;
  String totalShipment;
  double totalShipmentProgress;
  String totalPickups;
  double totalPickupsProgress;
  String consolidatedTotal;
  double consolidatedTotalProgress;

  ControlPanel({
    required this.shipments,
    required this.shipmentsDelivered,
    required this.consolidated,
    required this.assignedPickup,
    required this.rejectedPickup,
    required this.pickupCanceled,
    required this.pickupDelivered,
    required this.totalShipment,
    required this.totalShipmentProgress,
    required this.totalPickups,
    required this.totalPickupsProgress,
    required this.consolidatedTotal,
    required this.consolidatedTotalProgress,
  });

  factory ControlPanel.fromJson(Map<String, dynamic> json) => ControlPanel(
        shipments: json["shipments"],
        shipmentsDelivered: json["shipments_delivered"],
        consolidated: json["consolidated"],
        assignedPickup: json["assigned_pickup"],
        rejectedPickup: json["rejected_pickup"],
        pickupCanceled: json["pickup_canceled"],
        pickupDelivered: json["pickup_delivered"],
        totalShipment: json["total_shipment"],
        totalShipmentProgress: json["total_shipment_progress"]?.toDouble()/100,
        totalPickups: json["total_pickups"],
        totalPickupsProgress: json["total_pickups_progress"]?.toDouble()/100,
        consolidatedTotal: json["consolidated_total"],
        consolidatedTotalProgress:
            json["consolidated_total_progress"]?.toDouble()/100,
      );

  Map<String, dynamic> toJson() => {
        "shipments": shipments,
        "shipments_delivered": shipmentsDelivered,
        "consolidated": consolidated,
        "assigned_pickup": assignedPickup,
        "rejected_pickup": rejectedPickup,
        "pickup_canceled": pickupCanceled,
        "pickup_delivered": pickupDelivered,
        "total_shipment": totalShipment,
        "total_shipment_progress": totalShipmentProgress,
        "total_pickups": totalPickups,
        "total_pickups_progress": totalPickupsProgress,
        "consolidated_total": consolidatedTotal,
        "consolidated_total_progress": consolidatedTotalProgress,
      };
}
