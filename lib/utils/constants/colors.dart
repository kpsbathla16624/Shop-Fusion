import 'package:flutter/material.dart';

class SfColor {
  SfColor._();
  //app ke colors
  static const Color primary = Color(0xFF4B68FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);
  // text colors
  static const Color textprimary = Color(0xFF333333);
  static const Color textsecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;
  //background  colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  //BG CONTANIER COLOR
  static const Color lightContainer = Color(0xFFF6F6F6);
  static Color darkContainer = Colors.white.withOpacity(0.1);

  // button color
  static const Color buttonprimary = Color(0xFF4b68ff);
  static const Color buttonsecondary = Color(0xFF6C757D);
  static const Color buttondisabled = Color(0xFFC4C4C4);
  // BORDER COLORS
  static const Color borderprimary = Color(0xFFD9D9D9);
  static const Color bordersecondary = Color(0xFF6E6E6);
  // others
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;

  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);

  // gradient
  static const Gradient linearGradient = LinearGradient(begin: Alignment(0, 0), end: Alignment(0.707, -0.707), colors: [
    Color(0xffff9a9e),
    Color(0xfffad0c4),
    Color(0xfffad0c4),
  ]);
}
