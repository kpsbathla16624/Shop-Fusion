import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/utils/constants/colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // orders.clear();
    // saveOrderData(orders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: SfColor.primary,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: CachedNetworkImage(imageUrl: orders[index].image_path),
                  title: Text(orders[index].title),
                  subtitle: Row(
                    children: [
                      Text('Rs. ${orders[index].price + 2000} ', style: TextStyle(decoration: TextDecoration.lineThrough),),
                      SizedBox(width: 10),
                      Text('Rs. ${orders[index].price}', style: TextStyle(),),
                    ],
                  ),
                ),
                Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
