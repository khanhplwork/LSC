import 'dart:async';

import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/core/model/shipment_model/shipment_data.dart';
import 'package:lsc/core/model/trip_model/location.dart';
import 'package:lsc/core/model/user_model/user.dart';

User? user;

Map<String, String> headers = {
  "content-type": "application/json",
};

List<Location> curLiveLocations = [];

List<PendingOrder>? pendingOrders;

Timer? pendingOrdersTimer;

ShipmentData? selectedOrder;

bool isStartLiveLocation = false;
void disposeConstant() {
  isStartLiveLocation = false;
  selectedOrder = null;
  curLiveLocations.clear();
  pendingOrdersTimer = null;
  pendingOrders = null;
  headers = {
    "content-type": "application/json",
  };
  user = null;
}
