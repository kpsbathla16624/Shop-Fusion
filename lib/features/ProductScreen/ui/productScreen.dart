import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/ProductScreen/bloc/product_bloc.dart';
import 'package:shopfusion/features/cart/bloc/cart_bloc.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = ProductBloc();
    final CartBloc cartBloc = CartBloc();
    return BlocConsumer<ProductBloc, ProductState>(
      bloc: productBloc,
      listener: (context, state) {
        switch (state.runtimeType) {
          case AddedToCartState:
            final existingItemIndex = cart.indexWhere((item) => item.title == product.title);
            if (existingItemIndex != -1) {
              // If item already exists in cart, increase its amount by 1
              final existingItem = cart[existingItemIndex];
              cartBloc.add(IncrementCartItemAmount(productModel: existingItem));
              HELPER.showSnackBar('Added to cart ');
            } else {
              // If item doesn't exist in cart, add it
              cart.add(product);
              HELPER.showSnackBar('Added to cart ');
            }
            saveCartData(cart);
            break;
          default:
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SfColor.primary,
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Card(
                          margin: EdgeInsets.all(10),
                          shadowColor: Colors.grey.shade300,
                          child: Hero(tag: product.title, child: Image(image: NetworkImage(product.image_path))))),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(),
                  Text(
                    product.brand,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      BlocBuilder<ProductBloc, ProductState>(
                        bloc: productBloc,
                        builder: (context, state) {
                          switch (state.runtimeType) {
                            case wishlist:
                              return IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ));
                            default:
                              return IconButton(
                                  onPressed: () {
                                    productBloc.add(addedToWishlist(product));
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ));
                          }
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(product.rating.toString(), style: TextStyle(fontSize: 18)),
                      Icon(Icons.star, color: SfColor.secondary),
                      SizedBox(width: 30),
                      Text(
                        '${product.no_rating} Ratings and ${product.reviews} Reviews',
                        style: TextStyle(fontSize: 15, color: SfColor.primary),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Rs. ${product.price + 2000}',
                        style: TextStyle(fontSize: 28, color: Colors.grey, decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'Rs. ${product.price}',
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      productBloc.add(Product_Add_To_Cart(product));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Add To Cart'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(CupertinoIcons.shopping_cart),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Buy Now'),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.shopping_bag),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
