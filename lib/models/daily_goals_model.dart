import 'package:flutter/material.dart';

class CategoriesModel {
  String image,name_title;

  CategoriesModel(this.image,this.name_title);
/////
}

final List<String> image= [
  "assets/daily_goals_image/fitness.png",
  "assets/daily_goals_image/reading.png",
  "assets/daily_goals_image/mediation.png",
  "assets/daily_goals_image/self.png",
  "assets/daily_goals_image/money.png",
  "assets/daily_goals_image/habit.png",
  "assets/daily_goals_image/mediation.png",
  "assets/daily_goals_image/self.png",
  "assets/daily_goals_image/reading.png",
  "assets/daily_goals_image/mediation.png",
  "assets/daily_goals_image/self.png",
  "assets/daily_goals_image/money.png",
  "assets/daily_goals_image/habit.png",
  "assets/daily_goals_image/mediation.png",

];
List name_title= [
  "Fitness",
  "Reading",
  "Meditation",
  "Self Improvement",
  "Money",
  "Productivity Habits",
  "Meditation",
  "Self Improvement",
  "Reading",
  "Meditation",
  "Self Improvement",
  "Money",
  "Productivity Habits",
  "Meditation",

];
final List<CategoriesModel> catogriies = List.generate(
    image.length,
        (index) => CategoriesModel(
      '${image[index]}',
      '${name_title[index]}',
    )
);