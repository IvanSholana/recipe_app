import 'package:flutter/material.dart';
import 'package:recipe_app/data/meals_data.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/meal_screen.dart';
import 'package:recipe_app/components/app_bar.dart';
import 'package:recipe_app/data/category_data.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  Widget activeScreen = HomeScreen(
    allCategory: availableCategories,
  );
  int selectedPage = 0;

  void setActiveScreen(index) {
    setState(() {
      selectedPage = index;
      activeScreen = selectedPage == 0
          ? HomeScreen(
              allCategory: availableCategories,
            )
          : MealScreen(
              title: "Favorite",
              Meals: dummyMeals.sublist(5).toList(),
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        toolbarHeight: 125,
        title: const AppBarContent(),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal_sharp,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorite",
          )
        ],
        onTap: (index) {
          setActiveScreen(index);
        },
      ),
    );
  }
}
