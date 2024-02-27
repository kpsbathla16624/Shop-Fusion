part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class Product_Add_To_Cart extends ProductEvent {
  final ProductModel _productModel;
  Product_Add_To_Cart(this._productModel);
}

class Product_Buyed extends ProductEvent {
  final ProductModel _productModel;
  Product_Buyed(this._productModel);
}

class addedToWishlist extends ProductEvent {
  final ProductModel _productModel;

  addedToWishlist(this._productModel);
}

