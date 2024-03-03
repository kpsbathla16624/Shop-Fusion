import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/checkout/ui/checkout_screen.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutInitial()) {
    on<addressChanged>(_addressChanged);
    on<IncrementBUYItemAmount>(incrementCartItemAmount);
    on<DecrementBUYItemAmount>(decrementCartItemAmount);
    on<initalEventCheckout>(_initalEventCheckout);
  
  }

  FutureOr<void> _addressChanged(addressChanged event, Emitter<CheckoutState> emit) {
    emit(NewAdressState());
  }

  FutureOr<void> incrementCartItemAmount(IncrementBUYItemAmount event, Emitter<CheckoutState> emit) {
    event.productModel.amount = event.productModel.amount + 1;

    emit(amountUpdatedBuy());
  }

  FutureOr<void> decrementCartItemAmount(DecrementBUYItemAmount event, Emitter<CheckoutState> emit) {
    if (event.productModel.amount != 1) {
      event.productModel.amount = event.productModel.amount - 1;
      emit(amountUpdatedBuy());
    } else if (event.productModel.amount == 1) {
      emit(checkoutrebuild());
    }
  }

  FutureOr<void> _initalEventCheckout(initalEventCheckout event, Emitter<CheckoutState> emit) {
    emit(checkoutrebuild());
  }


}
