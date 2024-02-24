import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/Products.dart';
import 'package:shopfusion/features/Home/ui/Lists.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: others
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
