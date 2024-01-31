import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:lsc/core/model/user_model/user.dart';
import 'package:lsc/core/utils/constant.dart';

Future<bool> login(String username, String password) async {
  var url = Uri.parse("https://lscfreights.online/api_login.php");
  print("test username: $username");
  print("test password: $password");
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
