import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:lsc/core/model/control_panel_model/control_panel.dart';
import 'package:lsc/core/model/pending_order_model/pending_order.dart';
import 'package:lsc/core/model/shipment_model/shipment.dart';
import 'package:lsc/core/model/user_info_model/user_info.dart';
import 'package:lsc/core/model/user_model/user.dart';
import 'package:lsc/core/utils/constant.dart';
import 'package:lsc/core/api/network_service.dart';

Future<bool> login(String username, String password) async {
  var url = Uri.parse("https://lscfreights.online/api_login.php");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{"username": username, "password": password},
    ),
  );

  if (response.statusCode == 200) {
    // API call success
    print('API login call success');
    user = User.fromJson(jsonDecode(response.body));

    if (user!.data.userlevel.toString() == "3") {
      NetworkService().updateCookie(response);
      var box = Hive.box('lscBox');
      box.put('isLogin', true);
      box.put('username', username);
      box.put('password', password);
      return true;
    } else {
      return false;
    }
    // print(response.body);
  } else {
    // API call failed
    print('API login call failed with status code: ${response.statusCode}');
    // print(response.body);
    return false;
  }
}

Future<ControlPanel?> getControlPanelData() async {
  var url = Uri.parse("https://lscfreights.online/api_driver_dashboard.php");
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API getControlPanelData call success');
    ControlPanel controlPanelData = controlPanelFromJson(response.body);
    return controlPanelData;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API getControlPanelData call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}

Future<UserInfo?> getUserInfo() async {
  var url = Uri.parse("https://lscfreights.online/api_get_user_info.php");
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API getUserInfo call success');
    UserInfo userInfo = userInfoFromJson(response.body);
    return userInfo;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API getUserInfo call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}

Future<Shipment?> getAllShipment() async {
  var url = Uri.parse("https://lscfreights.online/api_shipments.php");
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API getAllShipment call success');
    Shipment shipment = shipmentFromJson(response.body);
    return shipment;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API getAllShipment call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}
Future<Shipment?> searchShipmentByTrackingID(String trackingID) async {

  var url;
  if(trackingID.isNotEmpty){
    url = Uri.parse("https://lscfreights.online/api_shipments.php?search=$trackingID");
  }else{
    url = Uri.parse("https://lscfreights.online/api_shipments.php");
  }
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API searchShipmentByTrackingID call success');
    Shipment shipment = shipmentFromJson(response.body);
    return shipment;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API searchShipmentByTrackingID call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}
Future<Shipment?> getRecentShipment() async {
  var url = Uri.parse("https://lscfreights.online/api_shipment_delivering.php");
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API getRecentShipment call success');
    Shipment shipment = shipmentFromJson(response.body);
    return shipment;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API getRecentShipment call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}

Future<List<PendingOrder>?> getPendingOrders() async {
  var url = Uri.parse("https://lscfreights.online/api_get_pending_orders.php");
  final response = await http.get(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
  );

  if (response.statusCode == 200) {
    // API call success
    print('API getPendingOrders call success');
    List<PendingOrder> pendingOrders = pendingOrderFromJson(response.body);
    return pendingOrders;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API getPendingOrders call failed with status code: ${response.statusCode}');
    // print(response.body);
    return null;
  }
}


Future<bool> completedOrder(String orderID) async {
  var url = Uri.parse("https://lscfreights.online/api_order_delivered.php");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
    body: jsonEncode(
      <String, dynamic>{"id": orderID},
    ),
  );

  if (response.statusCode == 200) {
    // API call success
    print('API completedOrder call success');

    return true;
    // print(response.body);
  } else {
    // API call failed
    print('API completedOrder call failed with status code: ${response.statusCode}');
    // print(response.body);
    return false;
  }
}


