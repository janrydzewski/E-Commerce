part of 'product_bloc.dart';

class ProductState extends Equatable {
  final List<ProductModel> productList;

  ProductState({List<ProductModel>? productList})
      : productList = productList ?? [];

  ProductState copyWith({
    List<ProductModel>? productList,
    bool? isLoaded,
  }) {
    return ProductState(
      productList: productList ?? this.productList,
    );
  }

  @override
  List<Object> get props => [productList];
}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;

  ProductError({
    List<ProductModel>? productList,
    required this.message,
  }) : super(
          productList: productList,
        );
}

class ProductAdded extends ProductState {}

class ProductAddedToCart extends ProductState {}
