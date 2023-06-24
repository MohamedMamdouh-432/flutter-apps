import 'package:flutter/material.dart';
import 'package:meal_app/food_data.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Meal> favList = mealsList.where((meal) => meal.isfav == true).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: ListView.builder(
        itemCount: favList.length,
        itemBuilder: (cxt, idx) => MealItem(
          id: favList[idx].id,
          title: favList[idx].title,
          phUrl: favList[idx].imgUrl,
          durtime: favList[idx].duration,
          complexLevel: favList[idx].complexity,
          affordAbiltiy: favList[idx].affordability,
        ),
      ),
    );
  }
}
