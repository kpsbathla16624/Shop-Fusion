part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class NavigateToWishlist_state extends HomeState {
  NavigateToWishlist_state(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WishlistScreen()));
  }
}
