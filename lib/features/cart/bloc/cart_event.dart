part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialevent extends CartEvent {}

class updateTotal extends CartEvent {
  double total;
  updateTotal({
    required this.total,
  });
}
