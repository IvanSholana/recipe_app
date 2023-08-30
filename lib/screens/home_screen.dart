import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_card.dart';
import 'package:recipe_app/data/category_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.allCategory});

  final allCategory;

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
        child: GridView.builder(
          itemCount: widget.allCategory.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) =>
              RecipeCard(category: widget.allCategory[index]),
        ),
      ),
    );
  }
}
