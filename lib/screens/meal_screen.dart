import 'package:flutter/material.dart';
import 'package:recipe_app/components/meal_card.dart';
import 'package:recipe_app/data/meals_data.dart';
import 'package:recipe_app/data/meals_class.dart';

class MealScreen extends StatelessWidget {
  MealScreen({super.key, required this.Meals, required this.title});
  final List<Meal> Meals;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Container(
              height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Meals.length,
                  itemBuilder: (context, index) =>
                      Center(child: MealCard(meal: Meals[index])),
                ),
              ),
            )
          ],
        ));
  }
}
