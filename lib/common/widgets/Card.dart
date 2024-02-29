import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/features/Home/bloc/home_bloc.dart';
import 'package:shopfusion/features/ProductScreen/ui/productScreen.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';
import 'package:cached_network_image/cached_network_image.dart';

String truncateString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text; // Return the original string if it's already within the limit
  } else {
    return text.substring(0, maxLength); // Return a substring of the original string
  }
}

Widget ProductCard(BuildContext context, ProductModel productModel) {
  final HomeBloc homeBloc = HomeBloc();
  return BlocListener<HomeBloc, HomeState>(
    bloc: homeBloc,
    listener: (context, state) {
      // TODO: implement listener
      if (state.runtimeType == NavigateToProduct_state) {
        HELPER.navigateToScreen(context, ProductScreen(product: productModel));
      }
    },
    child: InkWell(
      onTap: () {
        homeBloc.add(ProductScreenNavigate(productModel));
      },
      child: Card(
        margin: EdgeInsets.all(5),
        child: Container(
          width: 200,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Hero(
                    tag: productModel.title,
                    child: Image(
                      image: CachedNetworkImageProvider(
                        productModel.image_path,
                      ),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Rs. ${productModel.price }',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                SizedBox(height: 7),
                Text(
                  '${truncateString(productModel.title, 20)}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text('${truncateString(productModel.description, 20)}....'),
                SizedBox(height: 10),
                Container(
                  child: Row(
                    children: [
                      Text(productModel.rating.toString()),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24,
                        shadows: [Shadow(color: Colors.black, offset: Offset(0.2, 0.2))],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
