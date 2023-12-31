// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:recipe_app/components/category_card.dart';
import 'package:recipe_app/screens/meal_screen.dart';
import 'package:recipe_app/data/meals_data.dart';
import 'package:recipe_app/data/favorite_meals.dart';
import 'package:recipe_app/data/filter_meals.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.allCategory, required this.setFilter});
  void Function() setFilter;

  final List allCategory;

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Meal> meals;

  void chooseCategory(String id, String category) {
    setState(() {
      meals = dummyMeals
          .where((element) =>
              element.categories.contains(id) &&
              (element.isVegan || !filter[mealsType.Vegan]!) &&
              (element.isGlutenFree || !filter[mealsType.GlutenFree]!) &&
              (element.isLactoseFree || !filter[mealsType.LactoseFree]!) &&
              (element.isVegetarian || !filter[mealsType.Vegetarian]!))
          .toList();
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealScreen(
          setFilter: widget.setFilter,
          Meals: meals,
          title: category,
        ),
      ),
    );
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
      child: GridView.builder(
        itemCount: widget.allCategory.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => CategoryCard(
          category: widget.allCategory[index],
          chooseCategory: chooseCategory,
        ),
      ),
    );
  }
}
