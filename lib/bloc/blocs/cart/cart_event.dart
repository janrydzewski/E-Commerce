part of 'cart_bloc.dart';

class CartEvent {
  const CartEvent();
}

class GetCartProductsEvent extends CartEvent {
  final String uid;

  const GetCartProductsEvent(this.uid);
}

class DeleteProductFromCartEvent extends CartEvent {
  final String uid;
  final String id;

  const DeleteProductFromCartEvent(this.uid, this.id);
}
