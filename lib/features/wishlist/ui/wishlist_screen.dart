import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/utils/constants/colors.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    if (wislist.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(backgroundColor: SfColor.primary),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: wislist.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image(image: NetworkImage(wislist[index].image_path)),
                      title: Text(wislist[index].title),
                      trailing: Text('Rs.${wislist[index].price.toString()}'),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(backgroundColor: SfColor.primary),
          body: Center(
            child: Text('Nothing is in the wishlist'),
          ));
    }
  }
}
