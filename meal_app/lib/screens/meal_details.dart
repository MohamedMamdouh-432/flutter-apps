import 'package:flutter/material.dart';

import '../food_data.dart';

class MealDetailsPage extends StatefulWidget {
  const MealDetailsPage({super.key});

  @override
  State<MealDetailsPage> createState() => _MealDetailsPageState();
}

class _MealDetailsPageState extends State<MealDetailsPage> {
  @override
  Widget build(BuildContext context) {
    int idx =
        int.parse(ModalRoute.of(context)!.settings.arguments as String) - 1;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(mealsList[idx].title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  mealsList[idx].imgUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 13),
                child: Text(
                  'Ingredients',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                width: 360,
                height: 200,
                padding: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.blueGrey.shade800),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: mealsList[idx].ingredients.length,
                  itemBuilder: (cx, index) => Card(
                    color: Colors.orange.shade500,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                    child: Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        mealsList[idx].ingredients[index],
                        style: const TextStyle(fontSize: 18),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30, bottom: 13),
                child: Text(
                  'Steps',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                width: 360,
                height: 300,
                padding: const EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  border: Border.all(color: Colors.blueGrey.shade800),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: mealsList[idx].steps.length,
                  itemBuilder: (cx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xff800000),
                          child: Text(
                            '#${index + 1}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                        title: Text(
                          mealsList[idx].steps[index],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            setState(() => mealsList[idx].isfav = !mealsList[idx].isfav),
        tooltip: 'Add to Favourites',
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(
          mealsList[idx].isfav ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 30,
        ),
      ),
    );
  }
}
