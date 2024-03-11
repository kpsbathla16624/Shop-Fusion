import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopfusion/features/Home/ui/lists.dart';
import 'package:shopfusion/features/categoriesScreen/ui/Category.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class Category_row extends StatelessWidget {
  const Category_row({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        category_row('Mobiles', 'https://rukminim1.flixcart.com/flap/80/80/image/22fddf3c7da4c4f4.png?q=100',
            MobileCategory(list: mobiles), context),
        category_row(
            'Fashion',
            'https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0d75b34f7d8fbcb3.png?q=100',
            MobileCategory(
              list: others,
            ),
            context),
        category_row(
            'Electronics',
            'https://rukminim1.flixcart.com/flap/80/80/image/69c6589653afdb9a.png?q=100',
            MobileCategory(
              list: Electronics,
            ),
            context),
        category_row(
            'Home',
            'https://rukminim1.flixcart.com/flap/80/80/image/29327f40e9c4d26b.png?q=100',
            MobileCategory(
              list: [],
            ),
            context),
        category_row(
            'Appliances',
            'https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0139228b2f7eb413.jpg?q=100',
            MobileCategory(
              list: [],
            ),
            context),
        category_row(
            'Sports',
            'https://img.freepik.com/free-vector/soccer-volleyball-baseball-rugby-equipment_1441-4026.jpg',
            MobileCategory(
              list: [],
            ),
            context),
        category_row(
            'Boooks',
            'https://atlas-content-cdn.pixelsquid.com/stock-images/childrens-books-hardcover-book-4GMB1WA-600.jpg',
            MobileCategory(
              list: [],
            ),
            context),
        SizedBox(width: 15),
      ],
    );
  }
}

category_row(String text, String path, Widget screen, BuildContext context) {
  return InkWell(
    onTap: () {
      HELPER.navigateToScreen(context, screen);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Center(child: Image(image: CachedNetworkImageProvider(path))),
          ),
          Text(text)
        ],
      ),
    ),
  );
}
