part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeactionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class InitialState extends HomeState {}

class NavigateToWishlist_state extends HomeactionState {
  NavigateToWishlist_state(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
  }
}

class NavigateToProduct_state extends HomeactionState {
  
}
