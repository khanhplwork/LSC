class UserData {
    int id;
    String username;
    String email;
    int userlevel;

    UserData({
        required this.id,
        required this.username,
        required this.email,
        required this.userlevel,
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        userlevel: json["userlevel"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "userlevel": userlevel,
    };
}
