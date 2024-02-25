import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopfusion/features/Home/ui/home_screen.dart';

class FirstTimeScreen extends StatefulWidget {
  @override
  _FirstTimeScreenState createState() => _FirstTimeScreenState();
}

class _FirstTimeScreenState extends State<FirstTimeScreen> {
  late SharedPreferences _prefs;
  bool _isFirstTime = true;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  void _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _checkFirstTime();
  }

  void _checkFirstTime() {
    bool isFirstTime = _prefs.getBool('isFirstTime') ?? true;
    if (!isFirstTime) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      _prefs.setBool('isFirstTime', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Time Screen'),
      ),
      body: Center(
        child: Text('Welcome to the app for the first time!'),
      ),
    );
  }
}

