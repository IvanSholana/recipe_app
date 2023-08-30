// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:recipe_app/data/filter_meals.dart';

class AppBarContent extends StatefulWidget {
  AppBarContent(
      {super.key, required this.findSomething, required this.setFilter});

  void Function(String something) findSomething;
  void Function() setFilter;

  @override
  State<AppBarContent> createState() {
    return _AppBarState();
  }
}

class _AppBarState extends State<AppBarContent> {
  final kategori = TextEditingController();

  @override
  void dispose() {
    kategori.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            if (value.isEmpty) {
              widget.findSomething(value);
            }
          },
          controller: kategori,
          decoration: InputDecoration(
            filled: true,
            hintText: "Pencarian...",
            suffixIcon: const Icon(Icons.search),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onSubmitted: (text) {
            widget.findSomething(text);
          },
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: mealsType.values
                  .map(
                    (element) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            filter[element] = !filter[element]!;
                            widget.setFilter();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              color: filter[element]!
                                  ? Colors.white
                                  : Colors.green,
                              width: 1.0,
                            ),
                            backgroundColor:
                                filter[element]! ? Colors.green : Colors.white,
                            foregroundColor:
                                filter[element]! ? Colors.white : Colors.green),
                        child: Text(element.name.toString()),
                      ),
                    ),
                  )
                  .toList()),
        )
      ],
    );
  }
}
