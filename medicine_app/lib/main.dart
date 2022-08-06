import 'package:flutter/material.dart';
import 'package:medicine_app/pages/home_page.dart';
import 'package:medicine_app/pages/login_page.dart';

void main(List<String> args) {
  runApp(MedicineApp());
}

class MedicineApp extends StatelessWidget {
  const MedicineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'Login Page',
      routes: {
        'Login Page':(context) => LoginPage(),
        'Home Page':(context) => HomePage(),
      },
    );
  }
}