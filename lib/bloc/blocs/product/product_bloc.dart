import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce/repositories/repositories.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository}) : super(ProductState()) {
    on<GetProductsEvent>(_onGetProductsEvent);
    on<GetProductsCategoryEvent>(_onGetProductsCategoryEvent);
    on<AddProductToCartEvent>(_onAddProductToCartEvent);
  }

  _onGetProductsEvent(
      GetProductsEvent event, Emitter<ProductState> emit) async {
    try {
      final productList = await productRepository.getProducts(event.category);
      emit(state.copyWith(productList: productList, isLoaded: true));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  _onGetProductsCategoryEvent(
      GetProductsCategoryEvent event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      final productList = await productRepository.getProducts(event.category);
      emit(state.copyWith(productList: productList, isLoaded: true));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }

  _onAddProductToCartEvent(
      AddProductToCartEvent event, Emitter<ProductState> emit) async {
    try {
      await productRepository.addProductToCart(
          event.productCartModel, event.uid);
      emit(ProductAddedToCart());
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
