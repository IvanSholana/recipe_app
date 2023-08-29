import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final themeApp = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.light,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeApp,
      home: const HomeScreen(),
    );
  }
}
