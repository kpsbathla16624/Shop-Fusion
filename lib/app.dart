import 'package:flutter/material.dart';
import 'package:shopfusion/features/indicator_Screen/indicator.dart';
import 'package:shopfusion/utils/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: SfAppTheme.lightTheme,
      //darkTheme: SfAppTheme.DarkTheme,
      home: FirstTimeScreen(),
    );
  }
}
