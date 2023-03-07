// To parse this JSON data, do
//
//     final showMyGroupModel = showMyGroupModelFromJson(jsonString);

import 'dart:convert';

ShowMyGroupModel showMyGroupModelFromJson(String str) => ShowMyGroupModel.fromJson(json.decode(str));

String showMyGroupModelToJson(ShowMyGroupModel data) => json.encode(data.toJson());

class ShowMyGroupModel {
  ShowMyGroupModel({
    this.success,
    this.data,
  });

  bool? success;
  List<Datumgroups>? data;

  factory ShowMyGroupModel.fromJson(Map<String, dynamic> json) => ShowMyGroupModel(
    success: json["success"],
    data: json["data"] == null ? [] : List<Datumgroups>.from(json["data"]!.map((x) => Datumgroups.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datumgroups {
  Datumgroups({
    this.id,
    this.userId,
    this.name,
    this.image,
    this.description,
    this.memberAmount,
    this.private,
    this.password,
    this.groupLink,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? name;
  String? image;
  String? description;
  String? memberAmount;
  String? private;
  String? password;
  String? groupLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datumgroups.fromJson(Map<String, dynamic> json) => Datumgroups(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    memberAmount: json["member_amount"],
    private: json["private"],
    password: json["password"],
    groupLink: json["group_link"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "image": image,
    "description": description,
    "member_amount": memberAmount,
    "private": private,
    "password": password,
    "group_link": groupLink,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
