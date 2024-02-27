part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

class AddedToCartState extends ProductState {
  final ProductModel productModel;
  AddedToCartState({
    required this.productModel,
  });
}

class BuyNowState extends ProductState {
  final ProductModel productModel;
  BuyNowState({
    required this.productModel,
  });
}

class wishlist extends ProductState {
  

}
