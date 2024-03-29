import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
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

Future<Map<String, dynamic>> forgotPasswordSendEmail(String email) async {
  var url = Uri.parse("https://lscfreights.online/api_forgot_password.php");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, dynamic>{"email": email},
    ),
  );

  final jsonBody = jsonDecode(response.body);

  if (response.statusCode == 200) {
    // API call success
    print('API forgotPasswordSendEmail call success');
    return {
      "status": true,
      "message": jsonBody["message"],
    };
    // print(response.body);
  } else {
    // API call failed
    print(
        'API forgotPasswordSendEmail call failed with status code: ${response.statusCode}');
    // print(response.body);
    return {
      "status": false,
      "message": jsonBody["email"],
    };
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
  if (trackingID.isNotEmpty) {
    url = Uri.parse(
        "https://lscfreights.online/api_shipments.php?search=$trackingID");
  } else {
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

Future<bool> completedOrder(String orderID, List<XFile> images) async {
  var url = Uri.parse("https://lscfreights.online/api_order_delivered.php");
  var request = http.MultipartRequest('POST', url);
  request.headers.addAll(headers);
  request.fields['order_id'] = orderID;
  for (var i = 0; i < images.length; i++) {
    var bytes = await images[i].readAsBytes();
    request.files.add(
      http.MultipartFile.fromBytes(
        'filesMultiple[]',
        bytes,
        filename: images[i].path.split('/').last,
      ),
    );
  }
  var response = await request.send();
  if (response.statusCode == 200) {
    // API call success
    print('API completedOrder call success');

    return true;
    // print(response.body);
  } else {
    // API call failed
    print(
        'API completedOrder call failed with status code: ${response.statusCode}');
    // print(response.body);
    return false;
  }
}

Future<Map<String, dynamic>> uploadAvatar(XFile file) async {
  var url = Uri.parse("https://lscfreights.online/api_upload_avatar.php");
  var request = http.MultipartRequest('POST', url);
  var bytes = await file.readAsBytes();
  request.files.add(
    http.MultipartFile.fromBytes(
      'avatar',
      bytes,
      filename: file.path.split('/').last,
    ),
  );
  request.headers.addAll(headers);
  var response = await request.send();
  var responseString = await response.stream.bytesToString();
  if (response.statusCode == 200) {
    // API call success
    print('API uploadAvatar call success');

    return {
      "status": true,
      "message": jsonDecode(responseString)["url"],
    };
  } else {
    // API call failed
    print(
        'API uploadAvatar call failed with status code: ${response.statusCode}');
    // print(response.body);
    return {
      "status": false,
      "message": jsonDecode(responseString)["message"],
    };
  }
}

Future<bool> updateDriverInfo(UserInfo userInfo) async {
  var url = Uri.parse("https://lscfreights.online/api_edit_driver_info.php");
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
    body: jsonEncode(
      userInfo.toJson(),
    ),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> updateOrderStatusToDelivering(int id) async {
  var url = Uri.parse("https://lscfreights.online/api_order_in_transit.php");

  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json; charset=UTF-8',
      "Cookie": headers['cookie'] ?? "",
    },
    body: jsonEncode({"id": id}),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
