import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/cart/bloc/cart_bloc.dart';
import 'package:shopfusion/features/checkout/ui/checkout_screen.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final CartBloc cartBloc = CartBloc();

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    cartBloc.add(CartInitialevent());
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
      buildWhen: (previous, current) => current is CartInitial,
      builder: (context, state) {
        if (cart.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      print('item builder run');
                      print(cart[index].title);
                      return Card(
                          color: Colors.grey.shade300,
                          child: Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CachedNetworkImage(
                                    imageUrl: cart[index].image_path,
                                    height: 100,
                                    width: 100,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width - 170,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width - 170,
                                        child: Text(
                                          cart[index].title,
                                          style: TextStyle(fontSize: 25),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            cart[index].price.toString(),
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                                        ],
                                      ),
                                      BlocBuilder<CartBloc, CartState>(
                                        bloc: cartBloc,
                                        builder: (context, state) {
                                          print('amount updatd ');
                                          return Container(
                                            height: 50,
                                            width: 150,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
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
                                          //}
                                          //else {
                                          //   return Container(
                                          //     height: 50,
                                          //     width: 150,
                                          //     child: Row(
                                          //       mainAxisAlignment: MainAxisAlignment.start,
                                          //       children: [
                                          //         IconButton(
                                          //             onPressed: () {
                                          //               cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                                          //             },
                                          //             icon: Icon(Icons.remove)),
                                          //         Text(cart[index].amount.toString()),
                                          //         IconButton(
                                          //             onPressed: () {
                                          //               cartBloc.add(IncrementCartItemAmount(productModel: cart[index]));
                                          //             },
                                          //             icon: Icon(Icons.add))
                                          //       ],
                                          //     ),
                                          //   );
                                          // }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                          // ListTile(
                          //   leading: Image(image: CachedNetworkImageProvider(cart[index].image_path)),
                          //   title: Text(cart[index].title),
                          //   subtitle: Text('Rs. ${cart[index].price.toString()}'),
                          // trailing: BlocBuilder<CartBloc, CartState>(
                          //   bloc: cartBloc,
                          //   builder: (context, state) {
                          //     if (state.runtimeType == amountUpdated) {
                          //       print('amount updatd ');
                          //       return Container(
                          //         height: 50,
                          //         width: 150,
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             IconButton(
                          //                 onPressed: () {
                          //                   cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                          //                 },
                          //                 icon: Icon(Icons.remove)),
                          //             Text(cart[index].amount.toString()),
                          //             IconButton(
                          //                 onPressed: () {
                          //                   cartBloc.add(IncrementCartItemAmount(productModel: cart[index]));
                          //                 },
                          //                 icon: Icon(Icons.add))
                          //           ],
                          //         ),
                          //       );
                          //     } else {
                          //       return Container(
                          //         height: 50,
                          //         width: 150,
                          //         child: Row(
                          //           mainAxisAlignment: MainAxisAlignment.end,
                          //           children: [
                          //             IconButton(
                          //                 onPressed: () {
                          //                   cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                          //                 },
                          //                 icon: Icon(Icons.remove)),
                          //             Text(cart[index].amount.toString()),
                          //             IconButton(
                          //                 onPressed: () {
                          //                   cartBloc.add(IncrementCartItemAmount(productModel: cart[index]));
                          //                 },
                          //                 icon: Icon(Icons.add))
                          //           ],
                          //         ),
                          //       );
                          //     }
                          //   },
                          // ),
                          // ),
                          );
                    },
                  ),
                  BlocConsumer<CartBloc, CartState>(
                    bloc: cartBloc,
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              SizedBox(height: 30),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price : ',
                                    style: TextStyle(fontSize: 20, color: SfColor.primary),
                                  ),
                                  Text(
                                    total.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Discount ( 5% ): ',
                                    style: TextStyle(fontSize: 20, color: SfColor.primary),
                                  ),
                                  Text(
                                    discount.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Delivery Charges: ',
                                    style: TextStyle(fontSize: 20, color: SfColor.primary),
                                  ),
                                  Text(
                                    delivery_charge.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Amount: ',
                                    style: TextStyle(fontSize: 20, color: SfColor.primary),
                                  ),
                                  Text(
                                    final_total.toString(),
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        HELPER.navigateToScreen(context, checkoutScreen(productbought: cart));
                      },
                      child: Text(' Buy Now '))
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
