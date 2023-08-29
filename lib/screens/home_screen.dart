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
        elevation: 4,
        shadowColor: Colors.black45,
        toolbarHeight: 120,
        title: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                hintText: "Cari Kategori...",
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Hello World"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Hello World"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Hello World"),
                )
              ],
            )
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
