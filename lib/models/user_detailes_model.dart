import 'package:flutter/material.dart';
import 'package:improvescap/screen/home/screens/daily_goals/view/user_detailes.dart';

class UserDetailesModel {
  String image,name_title;

  UserDetailesModel(this.image,this.name_title);
/////
}

final List<String> image= [
  "assets/leaderboard_images/1.png",
  "assets/leaderboard_images/2.png",
  "assets/leaderboard_images/3.png",
  "assets/leaderboard_images/4.png",


];
List name_title= [
  "Emelie",
  "Abigail",
  "Penelope",
  "Elizabeth",


];

final List<UserDetailesModel> userdetailes = List.generate(
    image.length,
        (index) => UserDetailesModel(
      '${image[index]}',
      '${name_title[index]}',

    )
);