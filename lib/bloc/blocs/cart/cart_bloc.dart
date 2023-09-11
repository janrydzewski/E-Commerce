import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartState()) {
    on<GetCartProductsEvent>(_onGetCartProductsEvent);
    on<DeleteProductFromCartEvent>(_onDeleteProductFromCartEvent);
  }

  _onGetCartProductsEvent(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    try {
      final productCartList = await cartRepository.getCartProducts(event.uid);
      final cartPrice = await cartRepository.getCartPrice(event.uid);
      emit(state.copyWith(
          productCartList: productCartList,
          cartPrice: cartPrice!,
          isLoaded: true));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }

  _onDeleteProductFromCartEvent(
      DeleteProductFromCartEvent event, Emitter<CartState> emit) async {
    try {
      await cartRepository.deleteProductFromCart(event.uid, event.id);
      final productCartList = await cartRepository.getCartProducts(event.uid);
      final cartPrice = await cartRepository.getCartPrice(event.uid);
      emit(state.copyWith(
          productCartList: productCartList,
          cartPrice: cartPrice!,
          isLoaded: true));
    } catch (e) {
      emit(CartError(message: e.toString()));
    }
  }
}
