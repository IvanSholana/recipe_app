import 'package:flutter/material.dart';
import 'package:recipe_app/data/favorite_meals.dart';
import 'package:recipe_app/data/meals_class.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/data/filter_meals.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.meal}) : super(key: key);
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
                if (favoriteMeals.contains(widget.meal)) {
                  favoriteMeals.remove(widget.meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Added to Favirite"),
                    duration: Duration(seconds: 2),
                  ));
                } else {
                  favoriteMeals.add(widget.meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Remove from Favirite"),
                    duration: Duration(seconds: 2),
                  ));
                }
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
        child: Container(
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
                            padding: EdgeInsets.all(16),
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
                            padding: EdgeInsets.all(16),
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
                    margin: EdgeInsets.only(top: 50, right: 20, left: 20),
                    padding: EdgeInsets.all(10),
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
      ),
    );
  }
}
