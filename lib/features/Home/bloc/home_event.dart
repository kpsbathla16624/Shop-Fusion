part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class WislistButtonClicked extends HomeEvent {
  BuildContext context;
  WislistButtonClicked( this.context);
}
