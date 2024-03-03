part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutEvent {}

class addressChanged extends CheckoutEvent {}

class IncrementBUYItemAmount extends CheckoutEvent {
  final ProductModel productModel;
  IncrementBUYItemAmount({
    required this.productModel,
  });
}

class DecrementBUYItemAmount extends CheckoutEvent {
  final ProductModel productModel;
  DecrementBUYItemAmount({
    required this.productModel,
  });
}
