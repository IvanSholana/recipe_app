import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Judul Category"),
        Card(
          child: InkWell(
            child: Stack(
              children: [
                FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'))
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
