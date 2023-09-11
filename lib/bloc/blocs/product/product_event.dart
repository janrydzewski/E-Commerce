part of 'product_bloc.dart';

class ProductEvent {
  const ProductEvent();
}

class AddProductEvent extends ProductEvent {
  final ProductModel productModel;

  const AddProductEvent(this.productModel);
}

class GetProductsEvent extends ProductEvent {
  final String category;

  const GetProductsEvent(this.category);
}

class GetProductsCategoryEvent extends ProductEvent {
  final String category;

  const GetProductsCategoryEvent(this.category);
}

class AddProductToCartEvent extends ProductEvent {
  final ProductCartModel productCartModel;
  final String uid;

  const AddProductToCartEvent(this.productCartModel, this.uid);
}
