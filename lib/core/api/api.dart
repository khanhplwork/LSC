import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:lsc/core/model/control_panel_model/control_panel.dart';
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
    print('API call success');
    user = User.fromJson(jsonDecode(response.body));

    if (user!.data.userlevel.toString() == "3") {
      NetworkService().updateCookie(response);
      print('Test header: ${headers.toString()}');
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
    print('API call failed with status code: ${response.statusCode}');
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
