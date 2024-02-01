
import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
    int id;
    String username;
    dynamic nameOff;
    String password;
    dynamic token;
    String locker;
    int userlevel;
    String email;
    dynamic documentType;
    dynamic documentNumber;
    String fname;
    String lname;
    String avatar;
    dynamic ip;
    DateTime created;
    DateTime lastlogin;
    String lastip;
    String notes;
    String phone;
    String enrollment;
    String vehiclecode;
    String gender;
    int newsletter;
    dynamic terms;
    int active;

    UserInfo({
        required this.id,
        required this.username,
        required this.nameOff,
        required this.password,
        required this.token,
        required this.locker,
        required this.userlevel,
        required this.email,
        required this.documentType,
        required this.documentNumber,
        required this.fname,
        required this.lname,
        required this.avatar,
        required this.ip,
        required this.created,
        required this.lastlogin,
        required this.lastip,
        required this.notes,
        required this.phone,
        required this.enrollment,
        required this.vehiclecode,
        required this.gender,
        required this.newsletter,
        required this.terms,
        required this.active,
    });

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        username: json["username"],
        nameOff: json["name_off"],
        password: json["password"],
        token: json["token"],
        locker: json["locker"],
        userlevel: json["userlevel"],
        email: json["email"],
        documentType: json["document_type"],
        documentNumber: json["document_number"],
        fname: json["fname"],
        lname: json["lname"],
        avatar: json["avatar"],
        ip: json["ip"],
        created: DateTime.parse(json["created"]),
        lastlogin: DateTime.parse(json["lastlogin"]),
        lastip: json["lastip"],
        notes: json["notes"],
        phone: json["phone"],
        enrollment: json["enrollment"],
        vehiclecode: json["vehiclecode"],
        gender: json["gender"],
        newsletter: json["newsletter"],
        terms: json["terms"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name_off": nameOff,
        "password": password,
        "token": token,
        "locker": locker,
        "userlevel": userlevel,
        "email": email,
        "document_type": documentType,
        "document_number": documentNumber,
        "fname": fname,
        "lname": lname,
        "avatar": avatar,
        "ip": ip,
        "created": created.toIso8601String(),
        "lastlogin": lastlogin.toIso8601String(),
        "lastip": lastip,
        "notes": notes,
        "phone": phone,
        "enrollment": enrollment,
        "vehiclecode": vehiclecode,
        "gender": gender,
        "newsletter": newsletter,
        "terms": terms,
        "active": active,
    };
}
