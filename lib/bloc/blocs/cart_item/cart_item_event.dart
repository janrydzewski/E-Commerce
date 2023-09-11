part of 'cart_item_bloc.dart';

class CartItemEvent {}

class IncreaseQuantityInCartEvent extends CartItemEvent {
  final String id;
  final int quantity;
  final int finalPrice;

  IncreaseQuantityInCartEvent(
      {required this.id, required this.quantity, required this.finalPrice});
}

class DecreaseQuantityInCartEvent extends CartItemEvent {
  final String id;
  final int quantity;
  final int finalPrice;

  DecreaseQuantityInCartEvent(
      {required this.id, required this.quantity, required this.finalPrice});
}

class GetCartProductDetailsEvent extends CartItemEvent {
  final String uid;
  final String id;

  GetCartProductDetailsEvent(this.uid, this.id);
}
