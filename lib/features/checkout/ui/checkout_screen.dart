import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/adress/adresses.dart';
import 'package:shopfusion/features/checkout/bloc/checkout_bloc.dart';
import 'package:shopfusion/features/payment%20screen/ui/paymentScreen.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class checkoutScreen extends StatelessWidget {
  const checkoutScreen({super.key, required this.productbought});
  final List<ProductModel> productbought;

  @override
  Widget build(BuildContext context) {
    String selected_address = address[0];
    CheckoutBloc checkoutBloc = CheckoutBloc();
    print('Checkout screen');
    checkoutBloc.add(initalEventCheckout());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SfColor.primary,
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      bottomNavigationBar: Container(
        child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
              elevation: MaterialStateProperty.all<double>(0),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),
            //style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(SfColor.secondary)),
            onPressed: () {
              HELPER.navigateToScreen(context, PaymentScreen(products: productbought));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
              child: Text(
                'CheckOut',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delvering To:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    bloc: checkoutBloc,
                    builder: (context, state) {
                      return DropdownButton(
                          value: selected_address,
                          items: address
                              .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                              .toList(),
                          onChanged: (val) {
                            selected_address = val as String;
                            checkoutBloc.add(addressChanged());
                          });
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            for (int i = 0; i < productbought.length; i++)
              BlocConsumer<CheckoutBloc, CheckoutState>(
                bloc: checkoutBloc,
                buildWhen: (previous, current) => current is checkoutrebuild,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  print('Card built');

                  return Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CachedNetworkImage(imageUrl: productbought[i].image_path),
                        title: Text(productbought[i].title),
                        subtitle: Text('Rs. ${productbought[i].price}'),
                        trailing: BlocConsumer<CheckoutBloc, CheckoutState>(
                          buildWhen: (previous, current) => current is amountUpdatedBuy,
                          listener: (BuildContext context, CheckoutState) {},
                          bloc: checkoutBloc,
                          builder: (context, state) {
                            print('amount updatd ');

                            calculateBUYTotal(productbought);

                            return Container(
                              height: 50,
                              width: 110,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        checkoutBloc.add(DecrementBUYItemAmount(productModel: productbought[i]));
                                      },
                                      icon: Icon(Icons.remove)),
                                  Text(productbought[i].amount.toString()),
                                  IconButton(
                                      onPressed: () {
                                        checkoutBloc.add(IncrementBUYItemAmount(productModel: productbought[i]));
                                      },
                                      icon: Icon(Icons.add)),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            BlocConsumer<CheckoutBloc, CheckoutState>(
              buildWhen: (previous, current) => current is amountUpdatedBuy,
              bloc: checkoutBloc,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                calculateBUYTotal(productbought);
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
                              BUY_total.toString(),
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
                              final_buy_total.toString(),
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
