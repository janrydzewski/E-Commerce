part of 'orders_bloc.dart';

class OrdersState extends Equatable {
  final int index;
  final bool isLoaded;
  final List<ProductOrderModel> productList;

  OrdersState(
      {required this.index,
      bool? isLoaded,
      List<ProductOrderModel>? productList})
      : isLoaded = isLoaded ?? false,
        productList = productList ?? [];

  @override
  List<Object> get props => [index, productList, isLoaded];

  OrdersState copyWith({
    int? index,
    bool? isLoaded,
    List<ProductOrderModel>? productList,
  }) {
    return OrdersState(
      index: index ?? this.index,
      isLoaded: isLoaded ?? this.isLoaded,
      productList: productList ?? this.productList,
    );
  }
}

class OrdersError extends OrdersState {
  final String message;

  OrdersError({
    required this.message,
    required super.index,
  });
}
