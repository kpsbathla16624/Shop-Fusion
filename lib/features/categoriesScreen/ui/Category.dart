import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/features/Home/ui/lists.dart';
import 'package:shopfusion/utils/constants/colors.dart';

class MobileCategory extends StatefulWidget {
  const MobileCategory({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<ProductModel> list;
  @override
  State<MobileCategory> createState() => _MobileCategoryState();
}

class _MobileCategoryState extends State<MobileCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobiles",
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
        centerTitle: true,
        backgroundColor: SfColor.primary,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: widget.list
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Card(
                      color: Color.fromARGB(255, 244, 250, 255),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CachedNetworkImage(
                              imageUrl: e.image_path,
                              width: MediaQuery.of(context).size.width / 4,
                              height: 150,
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Rs. ${e.price + 2000}',
                                      style: TextStyle(fontSize: 14, color: Colors.grey, decoration: TextDecoration.lineThrough),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      'Rs. ${e.price}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
