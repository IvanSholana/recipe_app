import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.purple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
