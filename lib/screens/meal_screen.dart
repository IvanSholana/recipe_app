// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:recipe_app/components/meal_card.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:recipe_app/components/app_bar.dart';
import 'package:recipe_app/data/favorite_meals.dart';

class MealScreen extends StatefulWidget {
  MealScreen({
    super.key,
    required this.Meals,
    required this.title,
  });
  final List<Meal> Meals;
  final String title;

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  List<Meal>? showMeals;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showMeals = widget.Meals;
  }

  void findRecipe(String pencarian) {
    setState(() {
      if (pencarian.isNotEmpty) {
        showMeals =
            widget.Meals.where((element) => element.title.contains(pencarian))
                .toList();
      } else {
        showMeals = widget.Meals;
      }
    });
  }

  void addFavorite(Meal meal) {
    setState(() {
      if (favoriteMeals.contains(meal)) {
        favoriteMeals.remove(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Remove from Favorite"),
          duration: Duration(seconds: 2),
        ));
      } else {
        favoriteMeals.add(meal);
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Added to Favorite"),
          duration: Duration(seconds: 2),
        ));
      }
      if (widget.title == "Favorite") {
        showMeals =
            widget.Meals.where((element) => favoriteMeals.contains(element))
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != "Favorite"
          ? AppBar(
              elevation: 4,
              shadowColor: Colors.black,
              toolbarHeight: 125,
              title: AppBarContent(
                findSomething: findRecipe,
              ),
              automaticallyImplyLeading:
                  false, // This will remove the back arrow
            )
          : null,
      body: Center(
        child: SingleChildScrollView(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 500,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: showMeals!.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.Meals.length,
                        itemBuilder: (context, index) => Center(
                            child: MealCard(
                          meal: showMeals![index],
                          addFavorite: addFavorite,
                        )),
                      )
                    : Center(
                        child: Text(
                          "Ups Sorry, There is nothing to show here...",
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.title != "Favorite"
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
