import 'package:flutter/material.dart';
import 'package:training_app/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/shoubra.jpeg'),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Shoubra app to distribute students among training companies',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const ShoubraButton(
              content: 'Add Training Company',
              icon: Icons.add,
              routeToNavigate: '/addcompany',
            ),
            const SizedBox(height: 20),
            const ShoubraButton(
              content: 'Training Companies',
              icon: Icons.work,
              routeToNavigate: '/trainingcompaines',
            ),
            const SizedBox(height: 20),
            const ShoubraButton(
              content: 'Add Training Students',
              icon: Icons.school,
              routeToNavigate: '/addstudents',
            ),
          ],
        ),
      ),
    );
  }
}
