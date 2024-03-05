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
    on<CartInitialevent>(cartInitialevent);
   
  }

  FutureOr<void> updateTotal_(updateTotal event, Emitter<CartState> emit) {
    emit(updatedTotalState());
  }

  FutureOr<void> incrementCartItemAmount(IncrementCartItemAmount event, Emitter<CartState> emit) {
    event.productModel.amount = event.productModel.amount + 1;
    calculateTotal();
    emit(amountUpdated());
    emit(updatedTotalState());
  }

  FutureOr<void> decrementCartItemAmount(DecrementCartItemAmount event, Emitter<CartState> emit) {
    if (event.productModel.amount != 1) {
      event.productModel.amount = event.productModel.amount - 1;
      emit(amountUpdated());
    } else if (event.productModel.amount == 1) {
      emit(amountUpdated());
      cart.remove(event.productModel);
      emit(CartInitial());
    }
    calculateTotal();

    emit(updatedTotalState());
  }

  FutureOr<void> cartInitialevent(CartInitialevent event, Emitter<CartState> emit) {
    emit(CartInitial());
  }


}
