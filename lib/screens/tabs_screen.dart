import 'package:flutter/material.dart';
import 'package:recipe_app/data/category_data.dart';
import 'package:recipe_app/data/meals_data.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/meal_screen.dart';
import 'package:recipe_app/components/app_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  late Widget activeScreen;
  int selectedPage = 0;

  void findRecipe(String pencarian) {
    print(pencarian);
    setState(() {
      if (pencarian.isNotEmpty) {
        activeScreen = HomeScreen(
          allCategory: availableCategories
              .where((element) => element.title == pencarian)
              .toList(),
        );
      } else {
        activeScreen = HomeScreen(
          allCategory: availableCategories,
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = HomeScreen(allCategory: availableCategories);
  }

  void setActiveScreen(int index) {
    setState(() {
      selectedPage = index;
      if (selectedPage == 0) {
        activeScreen = HomeScreen(allCategory: availableCategories);
      } else if (selectedPage == 1) {
        activeScreen = MealScreen(
          title: "Favorite",
          Meals: dummyMeals.sublist(5).toList(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black,
        toolbarHeight: 125,
        title: AppBarContent(findSomething: findRecipe),
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
