import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/features/wishlist/ui/wishlist_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<WislistButtonClicked>(wislistButtonClicked);
    on<initalEvent>(_initalEvent);
    on<ProductScreenNavigate>(productScreenNavigate);
  }

  FutureOr<void> wislistButtonClicked(WislistButtonClicked event, Emitter<HomeState> emit) {
    emit(NavigateToWishlist_state(event.context));
    print('Wishist');
  }

  FutureOr<void> _initalEvent(initalEvent event, Emitter<HomeState> emit) {
    emit(InitialState());
  }

  FutureOr<void> productScreenNavigate(ProductScreenNavigate event, Emitter<HomeState> emit) {
    emit(NavigateToProduct_state());
  }
}
