import 'dart:convert';

UsersModel userModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String userModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.name,
    this.email,
    this.status,
    this.createAt,
    this.restoID,
    this.uid,
  });

  String? name;
  String? email;
  String? status;
  String? createAt;
  String? restoID;
  String? uid;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        name: json["name"],
        email: json["email"],
        status: json["status"],
        createAt: json["createAt"],
        restoID: json["restoID"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "status": status,
        "createAt": createAt,
        "restoID": restoID,
        "uid": uid,
      };
}
