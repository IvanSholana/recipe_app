import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_card.dart';
import 'package:recipe_app/components/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black45,
        toolbarHeight: 120,
        title: const AppBarContent(),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) => const RecipeCard(),
        ),
      ),
    );
  }
}
