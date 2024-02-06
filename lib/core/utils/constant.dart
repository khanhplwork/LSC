import 'dart:async';

import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/core/model/trip_model/location.dart';
import 'package:lsc/core/model/user_model/user.dart';

User? user;

Map<String, String> headers = {
  "content-type": "application/json",
};

List<Location> curLiveLocations = [];

List<PendingOrder>? pendingOrders;

Timer? pendingOrdersTimer;

void disposeConstant() {
  curLiveLocations.clear();
  pendingOrdersTimer = null;
  pendingOrders = null;
  headers = {
    "content-type": "application/json",
  };
  user = null;
}
