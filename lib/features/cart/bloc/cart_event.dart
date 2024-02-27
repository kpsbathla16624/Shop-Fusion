part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialevent extends CartEvent {}

class updateTotal extends CartEvent {
 
}

class IncrementCartItemAmount extends CartEvent {
  final ProductModel productModel;
  IncrementCartItemAmount({
    required this.productModel,
  });
  
}
class DecrementCartItemAmount extends CartEvent {
  final ProductModel productModel;
  DecrementCartItemAmount({
    required this.productModel,
  });
  
}
