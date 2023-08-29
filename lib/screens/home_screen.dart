import 'package:flutter/material.dart';
import 'package:recipe_app/components/recipe_card.dart';

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
        toolbarHeight: 100,
        title: Column(
          children: [
            TextField(
                decoration: InputDecoration(
              filled: true,
            )),
          ],
        ),
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
