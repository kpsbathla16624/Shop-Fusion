import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/common/widgets/Card.dart';
import 'package:shopfusion/common/widgets/ad_view.dart';
import 'package:shopfusion/common/widgets/category_row.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/Home/bloc/home_bloc.dart';
import 'package:shopfusion/features/Home/ui/lists.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

HomeBloc homeBloc = HomeBloc();

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc.add(initalEvent());
  }

  void loaddata() async {
    cart = await loadCartData();
    orders = await loadOrderData();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    loaddata();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case InitialState:
            return SingleChildScrollView(
              padding: EdgeInsets.all(8),
              scrollDirection: Axis.vertical,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                  height: 265,
                  width: double.infinity,
                  child: MyPageView(),
                ),
                SizedBox(height: 20),
                Divider(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(height: 10),
                      Category_row(),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Divider(),
                for (int i = 0; i < lists.length; i++)
                  if (lists[i].isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lists[i][0].category,
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: lists[i].map((e) => ProductCard(context, e)).toList(),
                          ),
                        ),
                        SizedBox(height: 10)
                      ],
                    ),
              ]),
            );
          default:
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}
