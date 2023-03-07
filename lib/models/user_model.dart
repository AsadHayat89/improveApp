import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class {
//   final String username;
//   final String uid;
//   final String email;
//   final String dateofBirth;
//   final String country;
//   final String photoUrl;
//
//   const ({
//     required this.username,
//     required this.uid,
//     required this.email,
//     required this.dateofBirth,
//     required this.country,
//     required this.photoUrl,
//   });
//
//   Map<String, dynamic> toJson()=>{
//     'username': username,
//     'uid' : uid,
//     'email': email,
//     'dateofBirth' : dateofBirth,
//     'country' : country,
//     'photoUrl' : photoUrl,
//   };
//   static  fromSnap(DocumentSnapshot snap){
//     var snapshot = snap.data() as Map<String, dynamic>;
//
//     return (
//       username: snapshot['username'],
//       uid: snapshot['uid'],
//       email: snapshot['email'],
//       dateofBirth: snapshot['dateofBirth'],
//       country: snapshot['country'],
//       photoUrl: snapshot['photoUrl'],
//     );
//   }
// }



class UserModel {
  var username;
  var uid;
  var email;
  var dateofBirth;
  var country;
  var photoUrl;


  UserModel(
      {
         this.username,
         this.uid,
         this.email,
         this.dateofBirth,
         this.country,
         this.photoUrl,
      });

  factory UserModel.fromMap(map) {
    return UserModel(
      username: map['username'],
      uid: map['uid'],
      email: map['email'],
      dateofBirth: map['dateofBirth'],
      country: map['country'],
      photoUrl: map['photoUrl'],


    );
  }
  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'uid' : uid,
      'email': email,
      'dateofBirth' : dateofBirth,
      'country' : country,
      'photoUrl' : photoUrl,
      //"like": like,

    };
  }
}
