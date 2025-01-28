import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    this.viewIsSelected = false,
  });

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(DietModel(
        name: 'Honney Pancakes',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30 mins',
        calorie: '180kCal',
        boxColor: Color(0xff92A3FD),
        viewIsSelected: true));
    diets.add(DietModel(
        name: 'Canai Breads',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20 mins',
        calorie: '230kCal',
        boxColor: Color(0xffC58BF2),
        viewIsSelected: false));

    return diets;
  }
}
