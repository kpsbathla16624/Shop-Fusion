import 'package:flutter/material.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({super.key, required this.Url, required this.text});
  final String Url;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [Image(image: AssetImage(Url)), 
        Text(text, style: TextStyle(fontSize: 30),)],
      ),
    );
  }
}
