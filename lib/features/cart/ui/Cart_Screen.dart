import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/cart/bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

final CartBloc cartBloc = CartBloc();

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      bloc: cartBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (cart.isNotEmpty) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image(image: NetworkImage(cart[index].image_path)),
                        title: Text(cart[index].title),
                        subtitle: Text('Rs. ${cart[index].price.toString()}'),
                        trailing: Container(
                          child: Row(
                            children: [Icon(Icons.remove), 
                            Text(cart[index].amount.toString()),
                            Icon(Icons.add)],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: Text('No items in the cart'),
          );
        }
      },
    );
  }
}
