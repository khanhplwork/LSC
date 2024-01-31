import 'dart:convert';

import 'package:lsc/core/model/user_model/user_data.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String message;
  UserData data;

  User({
    required this.message,
    required this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data.toJson(),
      };
}
