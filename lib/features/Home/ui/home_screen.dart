import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/Home/ui/home.dart';
import 'package:shopfusion/features/cart/ui/Cart_Screen.dart';
import 'package:shopfusion/features/profile/ui/profile_screen.dart';
import 'package:shopfusion/features/Home/bloc/home_bloc.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:shopfusion/utils/constants/colors.dart';

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
    shuffle_lists();
    _pageController = PageController(initialPage: selectedIndex);
    homeBloc.add(initalEvent());
    // cart.clear();
    // saveCartData(cart);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    print('home');
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: const CircleAvatar(
            radius: 5,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 3.5),
                  child: Image(image: AssetImage('assets/logo/LightLogo.png')) //SfDeviceUtil.logo(),
                  ),
            ),
          ),
        ),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: SfColor.secondary,
        ),
        centerTitle: true,
        backgroundColor: SfColor.primary,
        title: const Text(
          'Shop Fusion ',
        ),
        actions: [
          BlocListener<HomeBloc, HomeState>(
            bloc: homeBloc,
            listener: (context, state) {
              // TODO: implement listener
            },
            child: IconButton(
                onPressed: () {
                  homeBloc.add(WislistButtonClicked(context));
                },
                icon: const Icon(
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
        children: [const Home(), const CartScreen(), const ProfileScreen()],
      ),
    );
  }
}