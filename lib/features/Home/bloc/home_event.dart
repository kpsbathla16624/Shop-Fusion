part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class WislistButtonClicked extends HomeEvent {
  BuildContext context;
  WislistButtonClicked(this.context);
}

class initalEvent extends HomeEvent {}

class ProductScreenNavigate extends HomeEvent {
  final ProductModel productModel;
  ProductScreenNavigate(  this.productModel);
}


