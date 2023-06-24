enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  bool isGlutenFree, isLactoseFree, isVegetarian, isVegan, isfav;
  int duration;
  String id, title, imgUrl;
  Complexity complexity;
  Affordability affordability;
  List<String> categories, ingredients, steps;
  
  Meal({
    required this.isVegan,
    required this.duration,
    required this.imgUrl,
    required this.complexity,
    required this.affordability,
    required this.steps,
    required this.categories,
    required this.id,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.title,
    required this.isfav,
  });
}
