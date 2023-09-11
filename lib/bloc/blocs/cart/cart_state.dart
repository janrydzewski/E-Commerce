part of 'cart_bloc.dart';

class CartState extends Equatable{
  final List<ProductCartModel> productCartList;
  final int cartPrice;
  final bool isLoaded;

  CartState({
    List<ProductCartModel>? productCartList,
    int? cartPrice,
    bool? isLoaded,
  })  : productCartList = productCartList ?? [],
        cartPrice = cartPrice ?? 0,
        isLoaded = isLoaded ?? false;

  CartState copyWith({
    List<ProductCartModel>? productCartList,
    int? cartPrice,
    bool? isLoaded,
  }) {
    return CartState(
      productCartList: productCartList ?? this.productCartList,
      cartPrice: cartPrice ?? this.cartPrice,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object> get props => [productCartList, cartPrice, isLoaded];
}

class CartError extends CartState {
  final String message;

  CartError({
    List<ProductCartModel>? productCartList,
    int? cartPrice,
    bool? isLoaded,
    required this.message,
  }) : super(
          productCartList: productCartList,
          cartPrice: cartPrice,
          isLoaded: isLoaded,
        );
}
