import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';

part 'edit_product_admin_event.dart';

part 'edit_product_admin_state.dart';

class EditProductAdminBloc
    extends Bloc<EditProductAdminEvent, EditProductAdminState> {
  final AdminRepository adminRepository;

  EditProductAdminBloc({required this.adminRepository})
      : super(EditProductAdminState()) {
    on<GetProductAdminEvent>(_onGetProductAdminEvent);
  }

  _onGetProductAdminEvent(
      GetProductAdminEvent event, Emitter<EditProductAdminState> emit) async {
    try {
      final productList = await adminRepository.getProducts();
      emit(state.copyWith(productList: productList, isLoaded: true));
    } catch (e) {
      emit(EditProductError(message: e.toString()));
    }
  }
}
