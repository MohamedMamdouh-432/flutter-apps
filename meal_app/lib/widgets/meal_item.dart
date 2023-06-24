import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';


class MealItem extends StatelessWidget {
  final int durtime;
  final String id, title, phUrl;
  final Complexity complexLevel;
  final Affordability affordAbiltiy;

  const MealItem({
    super.key,
    required this.id,
    required this.title,
    required this.phUrl,
    required this.durtime,
    required this.complexLevel,
    required this.affordAbiltiy,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
                    context, 
                    '/details',
                    arguments: id.substring(1),
                  ),
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.network(phUrl),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 390,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        )),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 28),
                      Text(
                        ' $durtime min',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work, size: 28),
                      Text(
                        complexLevel == Complexity.Challenging
                            ? " Challenging"
                            : complexLevel == Complexity.Hard
                                ? " Hard"
                                : " Simple",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, size: 28),
                      Text(
                        affordAbiltiy == Affordability.Affordable
                            ? "Affordable"
                            : affordAbiltiy == Affordability.Luxurious
                                ? "Luxurious"
                                : "Pricey",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
