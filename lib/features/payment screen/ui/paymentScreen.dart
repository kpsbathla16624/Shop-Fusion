import 'package:flutter/material.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/orders%20Screen/ui/orderplaced.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';

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
      appBar: AppBar(
          backgroundColor: SfColor.primary,
          title: const Text(
            'Payment Options',
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Rs. $final_buy_total',
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          )),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 20),
            ExpansionTile(
              title: const Text(
                'UPI',
                style: TextStyle(fontSize: 20),
              ),
              leading: Image(height: 35, width: 35, image: AssetImage('assets/logo/upi.png')),
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Upi Id', // Background text
                      border: OutlineInputBorder(), // Optional border
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {
                      HELPER.navigateToScreen(context, OrderPlaced());
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Credit/Debit Card',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.payment),
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Card Number', // Background text
                      border: OutlineInputBorder(), // Optional border
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Net Banking',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.computer),
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Account Number', // Background text
                      border: OutlineInputBorder(), // Optional border
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Wallets',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.wallet),
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Wallet Id', // Background text
                      border: OutlineInputBorder(), // Optional border
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Gift Card',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.card_giftcard),
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Gift Coupon', // Background text
                      border: OutlineInputBorder(), // Optional border
                    ),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            ExpansionTile(
              title: const Text(
                'Cash On Delivery',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.currency_rupee),
              children: [
                TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(SfColor.secondary),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                      child: Text(
                        'Pay  $final_buy_total in Cash ',
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
