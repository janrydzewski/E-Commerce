part of 'edit_product_admin_bloc.dart';

class EditProductAdminState extends Equatable {
  final List<ProductModel> productList;
  final bool isLoaded;

  EditProductAdminState({
    List<ProductModel>? productList,
    bool? isLoaded,
  })  : productList = productList ?? [],
        isLoaded = isLoaded ?? false;

  EditProductAdminState copyWith({
    List<ProductModel>? productList,
    bool? isLoaded,
  }) {
    return EditProductAdminState(
      productList: productList ?? this.productList,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object> get props => [productList, isLoaded];
}

class EditProductError extends EditProductAdminState {
  final String message;

  EditProductError({
    List<ProductModel>? productList,
    bool? isLoaded,
    required this.message,
  }) : super(
          productList: productList,
          isLoaded: isLoaded,
        );
}
