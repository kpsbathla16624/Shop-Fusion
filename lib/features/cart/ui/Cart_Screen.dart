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
    return Scaffold(
      body: BlocConsumer<CartBloc, CartState>(
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
                            color: Colors.grey.shade100,
                            child: Column(
                              children: [
                                Container(
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
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          cart[index].amount = 1;
                                          cartBloc.add(DecrementCartItemAmount(productModel: cart[index]));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Remove',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        )),
                                    //Text('|', style: TextStyle(fontSize: 20),),
                                    TextButton(
                                        onPressed: () {
                                          HELPER.navigateToScreen(context, checkoutScreen(productbought: [cart[index]]));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            ' BUY NOW ',
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            ));
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
      ),
      bottomNavigationBar: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (cart.isNotEmpty) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'RS. ${final_total}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                          elevation: MaterialStateProperty.all<double>(0),
                          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                        ),
                        //style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(SfColor.secondary)),
                        onPressed: () {
                          HELPER.navigateToScreen(context, checkoutScreen(productbought: cart));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                          child: Text(
                            'Place Order',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                        )),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text('No items in the cart'),
            );
          }
        },
      ),
    );
  }
}
