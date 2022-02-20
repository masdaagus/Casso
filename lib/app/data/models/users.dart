import 'dart:convert';

UsersModel userModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String userModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.name,
    this.email,
    this.status,
    this.restoID,
    this.uid,
    this.password,
  });

  String? name;
  String? email;
  String? status;
  String? restoID;
  String? uid;
  String? password;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        name: json["name"],
        email: json["email"],
        status: json["status"],
        restoID: json["restoID"],
        uid: json["uid"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "status": status,
        "restoID": restoID,
        "uid": uid,
        "password": password,
      };
}
