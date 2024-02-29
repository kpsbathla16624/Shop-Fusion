import 'dart:async';

import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPageIndex < 4) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print('ads');
    return PageView(
      controller: _pageController,
      
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image(fit: BoxFit.fill, image: AssetImage('assets/images/ad1.png')),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image(fit: BoxFit.fill, image: AssetImage('assets/images/ad2.png')),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image(fit: BoxFit.fill, image: AssetImage('assets/images/ad3.png')),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image(fit: BoxFit.fill, image: AssetImage('assets/images/ad4.png')),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Image(fit: BoxFit.fill, image: AssetImage('assets/images/ad5.png')),
        ),
      ],
    );
  }
}
