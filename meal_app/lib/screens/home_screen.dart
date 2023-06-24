import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favourites_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int curTabIdx = 0;
  bool filtervisible = false,
      gluten = false,
      vegan = false,
      vegetarian = false,
      lactose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              color: Colors.amber,
              child: Text(
                'Cooking Up !',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () => Navigator.pop(context),
              leading: const Icon(
                Icons.restaurant,
                size: 26,
                color: Colors.red,
              ),
              title: Text(
                'Meals',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              onTap: () => setState(() => filtervisible = !filtervisible),
              leading: const Icon(
                Icons.settings,
                size: 28,
                color: Colors.green,
              ),
              title: Text(
                'Filters',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Icon(
                filtervisible ? Icons.arrow_circle_up : Icons.arrow_circle_down,
                color: Colors.green,
                size: 30,
              ),
            ),
            Visibility(
              visible: filtervisible,
              child: Column(
                children: [
                  CheckboxListTile(
                    value: gluten,
                    title: const Text('Gluten'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                    onChanged: (val) => setState(() => gluten = val!),
                  ),
                  CheckboxListTile(
                    value: vegan,
                    title: const Text('Vegan'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                    onChanged: (val) => setState(() => vegan = val!),
                  ),
                  CheckboxListTile(
                    value: vegetarian,
                    title: const Text('Vegetarian'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                    onChanged: (val) => setState(() => vegetarian = val!),
                  ),
                  CheckboxListTile(
                    value: lactose,
                    title: const Text('Lactose'),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 70, vertical: 0),
                    onChanged: (val) => setState(() => lactose = val!),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/meals', arguments: {
                      'id': '',
                      'title': 'Liked',
                      'isgluten': gluten,
                      'isvegen': vegan,
                      'isveget': vegetarian,
                      'islactose': lactose
                    }),
                    icon: const Icon(
                      Icons.filter_list,
                      size: 26,
                    ),
                    label: const Text('Filter', style: TextStyle(fontSize: 18)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.amber,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(curTabIdx == 0 ? 'Meals Categories' : 'Favourite Meals'),
        centerTitle: true,
      ),
      body: curTabIdx == 0 ? const CategoriesPage() : const FavouritesPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curTabIdx,
        onTap: (val) => setState(() => curTabIdx = val),
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
