// ignore_for_file: must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:recipe_app/data/favorite_meals.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.meal, required this.addFavorite});
  void Function(Meal meal) addFavorite;
  final Meal meal;

  @override
  State<DetailScreen> createState() {
    return _DetailScreenState();
  }
}

class _DetailScreenState extends State<DetailScreen> {
  String activeContain = "Recipe";

  void changeContain(String activeScreen) {
    setState(() {
      activeContain = activeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.addFavorite(widget.meal);
              });
            },
            icon: Icon(
              Icons.star,
              color: favoriteMeals.contains(widget.meal) ? Colors.orange : null,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage(widget.meal.imageUrl),
                    ),
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            widget.meal.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          changeContain("Recipe");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          color: activeContain == "Recipe"
                              ? Colors.lightGreen.withOpacity(0.2)
                              : null,
                          child: Text(
                            "Recipe",
                            style: TextStyle(
                              color: activeContain == "Recipe"
                                  ? Colors.lightGreen
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          changeContain("Step");
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16),
                          color: activeContain == "Step"
                              ? Colors.lightGreen.withOpacity(0.2)
                              : null,
                          child: Text(
                            "Step",
                            style: TextStyle(
                              color: activeContain == "Step"
                                  ? Colors.lightGreen
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [
                            Colors.green.withOpacity(0.5),
                            Colors.lightGreen.withOpacity(0.5)
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)),
                  child: Center(
                    child: Column(children: [
                      for (var item in activeContain == "Recipe"
                          ? widget.meal.ingredients
                          : widget.meal.steps)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                        )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
