import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.products});
  final List<ProductModel> products;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment Options'),),
    );
  }
}
