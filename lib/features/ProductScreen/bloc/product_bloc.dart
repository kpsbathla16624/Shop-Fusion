import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<Product_Add_To_Cart>(product_Add_To_Cart);
    on<Product_Buyed>(product_Buyed);
    on<addedToWishlist>(addedToWishlist_);
  }

  FutureOr<void> product_Add_To_Cart(Product_Add_To_Cart event, Emitter<ProductState> emit) {
    emit(AddedToCartState(productModel: event._productModel));
  }

  FutureOr<void> product_Buyed(Product_Buyed event, Emitter<ProductState> emit) {
    emit(BuyNowState(productModel: event._productModel));
  }

  FutureOr<void> addedToWishlist_(addedToWishlist event, Emitter<ProductState> emit) {
    wislist.add(event._productModel);
    emit(wishlist());
  }
}
