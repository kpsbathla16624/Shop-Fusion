import 'package:flutter/material.dart';

import 'package:shopfusion/data/repositories/Products_models.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: product.title, 
        child: Image(image: NetworkImage(product.image_path))),
    );
  }
}
