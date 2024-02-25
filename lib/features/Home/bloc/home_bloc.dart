import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';
import 'package:shopfusion/features/wishlist/ui/wishlist_screen.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<WislistButtonClicked>(wislistButtonClicked);
    on<initalEvent>(_initalEvent);
  }

  FutureOr<void> wislistButtonClicked(WislistButtonClicked event, Emitter<HomeState> emit) {
    emit(NavigateToWishlist_state(event.context));
    print('Wishist');
  }

  FutureOr<void> _initalEvent(initalEvent event, Emitter<HomeState> emit) {
    emit(InitialState());
  }
}
