import 'package:bloc/bloc.dart';

import 'package:ecommerce/resources/resources.dart';

import 'package:ecommerce/repositories/repositories.dart';

part 'cart_item_event.dart';

part 'cart_item_state.dart';

class CartItemBloc extends Bloc<CartItemEvent, CartItemState> {
  CartRepository cartRepository;

  CartItemBloc({required this.cartRepository})
      : super(CartItemState(quantity: 0, finalPrice: 0)) {
    on<IncreaseQuantityInCartEvent>(_onIncreaseQuantityInCartEvent);
    on<DecreaseQuantityInCartEvent>(_onDecreaseQuantityInCartEvent);
    on<GetCartProductDetailsEvent>(_onGetCartProductDetailsEvent);
  }

  _onIncreaseQuantityInCartEvent(
      IncreaseQuantityInCartEvent event, Emitter<CartItemState> emit) async {
    await cartRepository.updateProductInCart(firebaseAuth.currentUser!.uid,
        event.id, (event.quantity + 1).toString(), event.finalPrice.toString());
    emit(state.copyWith(
        quantity: event.quantity + 1,
        finalPrice: (event.quantity + 1) * event.finalPrice));
  }

  _onDecreaseQuantityInCartEvent(
      DecreaseQuantityInCartEvent event, Emitter<CartItemState> emit) async {
    await cartRepository.updateProductInCart(
        firebaseAuth.currentUser!.uid,
        event.id,
        (event.quantity - 1) < 0
            ? event.quantity.toString()
            : (event.quantity - 1).toString(),
        event.finalPrice.toString());
    emit(state.copyWith(
        quantity:
            (event.quantity - 1) < 0 ? event.quantity : event.quantity - 1,
        finalPrice:
            ((event.quantity - 0) < 1 ? event.quantity : event.quantity - 1) *
                event.finalPrice));
  }

  _onGetCartProductDetailsEvent(
      GetCartProductDetailsEvent event, Emitter<CartItemState> emit) async {
    final cartItemDetails =
        await cartRepository.getCartProductDetails(event.uid, event.id);
    final quantityFromFirebase = int.parse(cartItemDetails![0]);
    final finalPriceFromFirebase = int.parse(cartItemDetails[1]);
    emit(state.copyWith(
        quantity: quantityFromFirebase, finalPrice: finalPriceFromFirebase));
  }
}
