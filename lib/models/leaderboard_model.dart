import 'package:flutter/material.dart';

class LeaderboardModel {
  String image,name_title,rank;

  LeaderboardModel(this.image,this.name_title,this.rank);
/////
}

final List<String> image= [
"assets/leaderboard_images/l1.png",
"assets/leaderboard_images/l2.png",
"assets/leaderboard_images/l3.png",
"assets/leaderboard_images/l4.png",
"assets/leaderboard_images/l5.png",
"assets/leaderboard_images/l6.png",
];
List name_title= [
  "Eduardo",
  "Eduardo",
  "Eduardo",
  "Eduardo",
  "Eduardo",
  "Eduardo",

];
List rank= [
  "Rank:4",
  "Rank:5",
  "Rank:6",
  "Rank:7",
  "Rank:8",
  "Rank:9",


];
final List<LeaderboardModel> leaderboard = List.generate(
    image.length,
        (index) => LeaderboardModel(
      '${image[index]}',
      '${name_title[index]}',
      '${rank[index]}',
    )
);