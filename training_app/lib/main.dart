import 'package:flutter/material.dart';
import 'package:training_app/Database/db_helper.dart';
import 'package:training_app/View/add_company.dart';
import 'package:training_app/View/add_students.dart';
import 'package:training_app/View/home_page.dart';
import 'package:training_app/View/training_companies.dart';

void main() => runApp(const TrainingApp());

class TrainingApp extends StatelessWidget {
  const TrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    DatabaseHelper.connectDB();
    return MaterialApp(
      title: 'Shoubra Training App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      routes: {
        '/home': (context) => const HomePage(),
        '/addcompany': (context) => const CompanyAdder(),
        '/trainingcompaines': (context) => const TrainingCompanies(),
        '/addstudents': (context) => const StudentAdder(),
      },
      initialRoute: '/home',
    );
  }
}
