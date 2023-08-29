import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:recipe_app/data/category_class.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.category});

  final Category category;
  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: FadeInImage(
          fit: BoxFit.cover,
          placeholder: MemoryImage(kTransparentImage),
          image: NetworkImage(category.imageUrl)),
    );
  }
}
