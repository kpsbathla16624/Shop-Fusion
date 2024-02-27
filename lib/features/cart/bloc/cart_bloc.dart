import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<updateTotal>(updateTotal_);
    on<IncrementCartItemAmount>(incrementCartItemAmount);

    on<DecrementCartItemAmount>(decrementCartItemAmount);
  }

  FutureOr<void> updateTotal_(updateTotal event, Emitter<CartState> emit) {
    for (var i = 0; i < cart.length; i++) {
      event.total = event.total + wislist[i].price;
    }
    emit(updatedTotalState());
  }

  FutureOr<void> incrementCartItemAmount(IncrementCartItemAmount event, Emitter<CartState> emit) {
    event.productModel.amount = event.productModel.amount + 1;

    emit(amountUpdated());
  }

  FutureOr<void> decrementCartItemAmount(DecrementCartItemAmount event, Emitter<CartState> emit) {
    if (event.productModel.amount != 1) {
      event.productModel.amount = event.productModel.amount - 1;
    } else if (event.productModel.amount == 1) {
      cart.remove(event.productModel);
    }

    emit(amountUpdated());
  }
}
