import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabScreen> {
  Widget activeScreen = const HomeScreen();
  int selectedPage = 0;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        onTap: (index) {},
      ),
    );
  }
}
