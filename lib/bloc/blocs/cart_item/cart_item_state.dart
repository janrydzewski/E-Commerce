part of 'cart_item_bloc.dart';

class CartItemState {
  int quantity;
  int finalPrice;

  CartItemState({required this.quantity, required this.finalPrice});

  CartItemState copyWith({
    int? quantity,
    int? finalPrice,
  }) {
    return CartItemState(
      quantity: quantity ?? this.quantity,
      finalPrice: finalPrice ?? this.finalPrice,
    );
  }
}
