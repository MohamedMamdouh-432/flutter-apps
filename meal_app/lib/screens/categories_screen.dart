import 'package:flutter/material.dart';
import '../food_data.dart';
import '../widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 1.39,
        padding: const EdgeInsets.all(15),
        children: categoriesList
            .map((catdata) => CategoryItem(
                id: catdata.id, subject: catdata.title, color: catdata.color))
            .toList(),
      ),
    );
  }
}
