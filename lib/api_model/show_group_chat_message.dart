// To parse this JSON data, do
//
//     final showGroupMessagesModel = showGroupMessagesModelFromJson(jsonString);

import 'dart:convert';

ShowGroupMessagesModel showGroupMessagesModelFromJson(String str) => ShowGroupMessagesModel.fromJson(json.decode(str));

String showGroupMessagesModelToJson(ShowGroupMessagesModel data) => json.encode(data.toJson());

class ShowGroupMessagesModel {
  ShowGroupMessagesModel({
    this.message,
    this.data,
  });

  String? message;
  List<Datummessage>? data;

  factory ShowGroupMessagesModel.fromJson(Map<String, dynamic> json) => ShowGroupMessagesModel(
    message: json["message"],
    data: json["data"] == null ? [] : List<Datummessage>.from(json["data"]!.map((x) => Datummessage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datummessage {
  Datummessage({
    this.id,
    this.name,
    this.image,
    this.description,
    this.message,
    this.senderId,
  });

  int? id;
  String? name;
  String? image;
  String? description;
  String? message;
  String? senderId;

  factory Datummessage.fromJson(Map<String, dynamic> json) => Datummessage(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    description: json["description"],
    message: json["message"],
    senderId: json["sender_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "description": description,
    "message": message,
    "sender_id": senderId,
  };
}
