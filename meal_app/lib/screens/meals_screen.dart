import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../models/meal.dart';
import '../food_data.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> argData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List<Meal> meals = mealsList.where((meal) {
      bool idres = false;
      if (argData['id'] != null)
        idres = meal.categories.contains(argData['id']);
      return idres ||
          meal.isGlutenFree == argData['isgluten'] &&
          meal.isLactoseFree == argData['islactose'] &&
          meal.isVegan == argData['isvegen'] &&
          meal.isVegetarian == argData['isveget'];
    }).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(argData['title']),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (cxt, idx) => MealItem(
          id: meals[idx].id,
          title: meals[idx].title,
          phUrl: meals[idx].imgUrl,
          durtime: meals[idx].duration,
          complexLevel: meals[idx].complexity,
          affordAbiltiy: meals[idx].affordability,
        ),
      ),
    );
  }
}
