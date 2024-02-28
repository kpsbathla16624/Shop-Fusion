import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final CartBloc cartBloc = CartBloc();

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {
        if (state.runtimeType == amountUpdated) {
          saveCartData(cart);
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        if (cart.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      print('item builder run');
                      return Card(
                        child: ListTile(
                          leading: Image(image: CachedNetworkImageProvider(cart[index].image_path)),
                          title: Text(cart[index].title),
                          subtitle: Text('Rs. ${cart[index].price.toString()}'),
                          trailing: BlocBuilder<CartBloc, CartState>(
                            bloc: cartBloc,
                            builder: (context, state) {
                              if (state.runtimeType == amountUpdated) {
                                return Container(
                                  height: 50,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                                          },
                                          icon: Icon(Icons.remove)),
                                      Text(cart[index].amount.toString()),
                                      IconButton(
                                          onPressed: () {
                                            cartBloc.add(IncrementCartItemAmount(productModel: cart[index]));
                                          },
                                          icon: Icon(Icons.add))
                                    ],
                                  ),
                                );
                              } else {
                                return Container(
                                  height: 50,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                                          },
                                          icon: Icon(Icons.remove)),
                                      Text(cart[index].amount.toString()),
                                      IconButton(
                                          onPressed: () {
                                            cartBloc.add(IncrementCartItemAmount(productModel: cart[index]));
                                          },
                                          icon: Icon(Icons.add))
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  Center(
                    child: Text(total.toString()),
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text('No items in the cart'),
          );
        }
      },
    );
  }
}
