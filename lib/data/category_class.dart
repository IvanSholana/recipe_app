import 'package:flutter/material.dart';

class Category {
  Category(
      {required this.id,
      this.color = Colors.white,
      required this.title,
      required this.imageUrl});

  final String id, title, imageUrl;
  final Color color;
}
