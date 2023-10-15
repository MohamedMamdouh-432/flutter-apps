import 'package:flutter/material.dart';

class ShoubraButton extends StatelessWidget {
  final String content, routeToNavigate;
  final IconData icon;

  const ShoubraButton({
    Key? key,
    required this.content,
    required this.routeToNavigate,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeToNavigate),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(content, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
