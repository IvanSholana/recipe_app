import 'package:flutter/material.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/screens/detail_screen.dart';

class MealCard extends StatelessWidget {
  MealCard({super.key, required this.meal, required this.addFavorite});
  void Function(Meal meal) addFavorite;

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final cardWidth =
        MediaQuery.of(context).size.width * 0.9; // Adjust the factor as needed

    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                DetailScreen(meal: meal, addFavorite: addFavorite),
          ));
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: meal.imageUrl,
                fit: BoxFit.cover,
                // Set the width of the image to match the card's width
              ),
            ),
            Container(
              width: cardWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    meal.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        '${meal.duration.toString()} min',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.auto_awesome, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        meal.complexity.name[0].toUpperCase() +
                            meal.complexity.name.substring(1),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.monetization_on, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        meal.affordability.name[0].toUpperCase() +
                            meal.affordability.name.substring(1),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
