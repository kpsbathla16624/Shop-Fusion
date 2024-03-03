part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

class NewAdressState extends CheckoutState{}
class amountUpdatedBuy extends CheckoutState{}
class amountZero extends CheckoutState{}
class checkoutrebuild extends CheckoutState{}