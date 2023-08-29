import 'package:flutter/material.dart';
import 'package:recipe_app/data/filter_meals.dart';

class AppBarContent extends StatefulWidget {
  const AppBarContent({super.key});

  @override
  State<AppBarContent> createState() {
    return _AppBarState();
  }
}

class _AppBarState extends State<AppBarContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            hintText: "Cari Kategori...",
            suffixIcon: Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: mealsType.values
                  .map((element) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(element.name.toString()),
                          style: ElevatedButton.styleFrom(),
                        ),
                      ))
                  .toList()),
        )
      ],
    );
  }
}
