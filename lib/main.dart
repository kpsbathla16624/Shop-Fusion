import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopfusion/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopfusion/firebase_options.dart';

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
