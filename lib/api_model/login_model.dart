// // To parse this JSON data, do
// //
// //     final loginModel = loginModelFromJson(jsonString);
//
// import 'dart:convert';
//
// List<dynamic> loginModelFromJson(String str) => List<dynamic>.from(json.decode(str).map((x) => x));
//
// String loginModelToJson(List<dynamic> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
//
// class LoginModelClass {
//   LoginModelClass({
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   bool? success;
//   String? message;
//   Data? data;
//
//   factory LoginModelClass.fromJson(Map<String, dynamic> json) => LoginModelClass(
//     success: json["success"],
//     message: json["message"],
//     data: Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "data": data!.toJson(),
//   };
// }
//
// class Data {
//   Data({
//     this.id,
//     this.name,
//     this.email,
//     this.apiToken,
//     this.emailVerifiedAt,
//     this.dob,
//     this.country,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   int? id;
//   String? name;
//   String? email;
//   String? apiToken;
//   dynamic emailVerifiedAt;
//   dynamic dob;
//   dynamic country;
//   String? image;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["id"],
//     name: json["name"],
//     email: json["email"],
//     apiToken: json["api_token"],
//     emailVerifiedAt: json["email_verified_at"],
//     dob: json["dob"],
//     country: json["country"],
//     image: json["image"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "email": email,
//     "api_token": apiToken,
//     "email_verified_at": emailVerifiedAt,
//     "dob": dob,
//     "country": country,
//     "image": image,
//     "created_at": createdAt!.toIso8601String(),
//     "updated_at": updatedAt!.toIso8601String(),
//   };
// }
