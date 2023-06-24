import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.id,
      required this.subject,
      required this.color});
  final String id, subject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Future.delayed(const Duration(seconds: 3)),
        Navigator.pushNamed(
        context, 
        '/meals',
        arguments: {
          'id': id,
          'title': subject,
          'isgluten': false,
          'isvegen': false,
          'isveget': false,
          'islactose': false
        },
      )
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.2),
              color.withOpacity(0.4),
              color.withOpacity(0.6),
              color.withOpacity(0.8),
              color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            subject,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
    );
  }
}
