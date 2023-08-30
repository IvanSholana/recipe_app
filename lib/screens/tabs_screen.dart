import 'package:flutter/material.dart';
import 'package:recipe_app/data/category_data.dart';
import 'package:recipe_app/data/meals_data.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/meal_screen.dart';
import 'package:recipe_app/components/app_bar.dart';
import 'package:recipe_app/data/favorite_meals.dart';
import 'package:recipe_app/data/filter_meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  late Widget activeScreen;
  int selectedPage = 0;

  void findRecipe(String pencarian) {
    setState(() {
      if (pencarian.isNotEmpty) {
        activeScreen = HomeScreen(
          setFilter: setFilters,
          allCategory: availableCategories
              .where((element) => element.title == pencarian)
              .toList(),
        );
      } else {
        activeScreen = HomeScreen(
          allCategory: availableCategories,
          setFilter: setFilters,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(
      allCategory: availableCategories,
      setFilter: setFilters,
    );
  }

  void setActiveScreen(int index) {
    setState(() {
      selectedPage = index;
      if (selectedPage == 0) {
        activeScreen = HomeScreen(
          allCategory: availableCategories,
          setFilter: setFilters,
        );
      } else if (selectedPage == 1) {
        activeScreen = MealScreen(
          setFilter: setFilters,
          title: "Favorite",
          Meals: dummyMeals
              .where((element) => favoriteMeals.contains(element))
              .toList(),
        );
      }
    });
  }

  Map<mealsType, bool> newFilter = filter;
  void setFilters() {
    setState(() {
      newFilter = filter;
      setActiveScreen(selectedPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        toolbarHeight: 125,
        title: AppBarContent(findSomething: findRecipe, setFilter: setFilters),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal_sharp),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          ),
        ],
        onTap: setActiveScreen,
      ),
    );
  }
}
