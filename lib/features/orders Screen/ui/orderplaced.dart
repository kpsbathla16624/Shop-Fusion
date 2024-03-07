import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/orders%20Screen/ui/OrderScreen.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({super.key});

  @override
  State<OrderPlaced> createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      HELPER.navigateToScreenReplacement(context, OrderScreen());
      saveOrderData(orders);
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Lottie.asset('assets/logo/orderPlaced.json'),
            ),
            Text(
              'Order Placed',
              style: TextStyle(color: Colors.black, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
