import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopfusion/data/repositories/Products.dart';
import 'package:shopfusion/features/Home/ui/home.dart';
import 'package:shopfusion/features/wishlist/ui/wishlist_screen.dart';
import 'package:shopfusion/features/Home/bloc/home_bloc.dart';
import 'package:shopfusion/utils/helpers/helper_function.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:shopfusion/utils/constants/colors.dart';
import 'package:shopfusion/utils/device/device_util.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int selectedIndex = 0;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = HomeBloc();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(5),
          child: CircleAvatar(
            radius: 5,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 3.5),
                child: SfDeviceUtil.logo(),
              ),
            ),
          ),
        ),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: SfColor.secondary,
        ),
        centerTitle: true,
        backgroundColor: SfColor.primary,
        title: Text(
          'Shop Fusion ',
        ),
        actions: [
          BlocListener<HomeBloc, HomeState>(
            bloc: homeBloc,
            listener: (context, state) {
              // TODO: implement listener
              if (state is NavigateToWishlist_state) {
                print('YES');
              } else {
                print('Erro');
              }
            },
            child: IconButton(
                onPressed: () {
                  homeBloc.add(WislistButtonClicked(context));
                },
                icon: Icon(
                  Icons.favorite,
                  color: SfColor.secondary,
                )),
          )
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        barItems: [
          BarItem(title: 'Home', icon: CupertinoIcons.home),
          BarItem(title: 'Cart', icon: CupertinoIcons.shopping_cart),
          BarItem(title: 'Profile', icon: CupertinoIcons.person)
        ],
        selectedIndex: selectedIndex,
        onButtonPressed: onButtonPressed,
        inactiveColor: Colors.yellow.shade100,
        activeColor: SfColor.secondary,
        backgroundColor: SfColor.primary,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Home(),
          Center(
            child: Text('Cart'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
    );
  }
}
