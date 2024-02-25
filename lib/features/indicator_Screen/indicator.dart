import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopfusion/common/widgets/Card.dart';
import 'package:shopfusion/common/widgets/information_containers.dart';
import 'package:shopfusion/features/Home/ui/home_screen.dart';
import 'package:shopfusion/features/Home/ui/lists.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  int _currentPageIndex = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    List screens = [
      InformationContainer(Url: 'assets/images/gif4.gif', text: 'text'),
      InformationContainer(Url: 'assets/images/gif3.gif', text: 'text'),
      InformationContainer(Url: 'assets/images/gif2.gif', text: 'text'),
      InformationContainer(Url: 'assets/images/gif1.gif', text: 'text'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.transparent,
        child: Center(child: SmoothPageIndicator(controller: controller, count: screens.length, effect: ExpandingDotsEffect())),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 1000,
                child: PageView.builder(
                  controller: controller,
                  itemCount: screens.length,
                  itemBuilder: (_, index) {
                    return screens[index];
                  },
                  onPageChanged: (index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _currentPageIndex == screens.length - 1
          ? FloatingActionButton(
              child: Icon(CupertinoIcons.arrow_right),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            )
          : FloatingActionButton(
              child: Icon(CupertinoIcons.arrow_right),
              onPressed: () {
                controller.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
              },
            ),
    );
  }
}
