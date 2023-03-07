// To parse this JSON data, do
//
//     final showAllLogoModel = showAllLogoModelFromJson(jsonString);

import 'dart:convert';

ShowAllLogoModel showAllLogoModelFromJson(String str) => ShowAllLogoModel.fromJson(json.decode(str));

String showAllLogoModelToJson(ShowAllLogoModel data) => json.encode(data.toJson());

class ShowAllLogoModel {
  ShowAllLogoModel({
    this.the0,
    this.the1,
    this.success,
    this.message,
  });

  String? the0;
  List<The1>? the1;
  bool? success;
  String? message;

  factory ShowAllLogoModel.fromJson(Map<String, dynamic> json) => ShowAllLogoModel(
    the0: json["0"],
    the1: json["1"] == null ? [] : List<The1>.from(json["1"]!.map((x) => The1.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "0": the0,
    "1": the1 == null ? [] : List<dynamic>.from(the1!.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class The1 {
  The1({
    this.id,
    this.userId,
    this.image,
    this.description,
    this.gym,
    this.read,
    this.skill,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? image;
  String? description;
  String? gym;
  String? read;
  String? skill;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
    id: json["id"],
    userId: json["user_id"],
    image: json["image"],
    description: json["description"],
    gym: json["gym"],
    read: json["read"],
    skill: json["skill"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image": image,
    "description": description,
    "gym": gym,
    "read": read,
    "skill": skill,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
