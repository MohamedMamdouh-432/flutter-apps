import 'package:flutter/material.dart';
import 'screens/meal_details.dart';
import 'screens/meals_screen.dart';
import 'screens/home_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.pink,
        canvasColor: const Color.fromARGB(225, 228, 228, 197),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(
            color: Color.fromRGBO(20, 50, 50, 0.8),
          ),
          bodySmall: const TextStyle(
            color: Color.fromRGBO(40, 80, 100, 0.8),
          ),
          titleLarge: const TextStyle(
            fontSize: 24,
            fontFamily: 'Robot',
          ),
          titleMedium: const TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway',
          ),
          labelMedium: const TextStyle(
            fontSize: 16,
            fontFamily: 'Robot',
          )
        ),
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoriesPage(),
        '/meals': (context) => const MealsPage(),
        '/details': (context) => const MealDetailsPage(),
      },
      initialRoute: '/home',
    );
  }
}
