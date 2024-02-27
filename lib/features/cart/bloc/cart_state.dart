part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class updatedTotalState extends CartState {}


class amountUpdated extends CartState{}