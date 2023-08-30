import 'package:flutter/material.dart';
import 'package:recipe_app/components/meal_card.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:recipe_app/components/app_bar.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.Meals, required this.title});
  final List<Meal> Meals;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: title != "Favorite"
          ? AppBar(
              elevation: 4,
              shadowColor: Colors.black,
              toolbarHeight: 125,
              title: const AppBarContent(),
              automaticallyImplyLeading:
                  false, // This will remove the back arrow
            )
          : null,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                    colors: [Colors.green, Colors.lightGreen]),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 500,
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
        ),
      ),
      bottomNavigationBar: title != "Favorite"
          ? Container(
              margin: const EdgeInsets.only(
                  bottom: 25), // Sesuaikan dengan ketinggian yang diinginkan
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.home),
                        SizedBox(width: 8),
                        Text('Home'),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
