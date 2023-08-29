import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/data/category_class.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.category});

  final Category category;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Positioned.fill(
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(category.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 70,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    category.title,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
