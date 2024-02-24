import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/Products.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: products
              .map((e) => Card(
                    child: Image(
                      image: NetworkImage(
                        e.image_path,
                      ),
                      height: 100,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
