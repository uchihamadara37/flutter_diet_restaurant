class PopularDiet {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularDiet({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    this.boxIsSelected = false,
  });

  static List<PopularDiet> getPopular(){
    return [
      PopularDiet(
        name: 'Blueberry Pancakes',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30 mins',
        calorie: '200kCal',
        boxIsSelected: true,
      ),
      PopularDiet(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '300kCal',
        boxIsSelected: false,
      )
    ];
  }
}