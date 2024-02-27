import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/common/widgets/Card.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    lists.shuffle();
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
              scrollDirection: Axis.vertical,
              child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lists[0][0].category,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: lists[0].map((e) => ProductCard(context, e)).toList(),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lists[1][0].category,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: lists[1].map((e) => ProductCard(context, e)).toList(),
                      ),
                    ],
                  ),
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
    // Container(
    //   child: Column(
    //     children: [
    //       SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         child: Row(
    //           children: others
    //               .map((e) => Card(
    //                     child: Image(
    //                       image: NetworkImage(
    //                         e.image_path,
    //                       ),
    //                       height: 100,
    //                     ),
    //                   ))
    //               .toList(),
    //         ),
    //       ),
    //       Row(
    //         children: mobiles
    //             .map((e) => Card(
    //                   child: Image(
    //                     image: NetworkImage(
    //                       e.image_path,
    //                     ),
    //                     height: 100,
    //                   ),
    //                 ))
    //             .toList(),
    //       ),
    //     ],
    //   ),
    // );
  }
}
