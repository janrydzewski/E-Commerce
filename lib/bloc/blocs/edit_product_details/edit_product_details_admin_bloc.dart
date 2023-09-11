import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ecommerce/repositories/repositories.dart';

part 'edit_product_details_admin_event.dart';

part 'edit_product_details_admin_state.dart';

class EditProductDetailsAdminBloc
    extends Bloc<EditProductDetailsAdminEvent, EditProductDetailsAdminState> {
  final AdminRepository adminRepository;

  EditProductDetailsAdminBloc({required this.adminRepository})
      : super(EditProductDetailsAdminState()) {
    on<EditProductEvent>(_onEditProductEvent);
    on<EditPhotoAdminDetailsEvent>(_onEditPhotoEvent);
  }

  _onEditPhotoEvent(EditPhotoAdminDetailsEvent event,
      Emitter<EditProductDetailsAdminState> emit) async {
    try {
      emit(state.copyWith(file: event.file, isLoaded: true));
    } catch (e) {
      emit(EditProductDetailsError(message: e.toString()));
    }
  }

  _onEditProductEvent(EditProductEvent event,
      Emitter<EditProductDetailsAdminState> emit) async {
    try {
      await adminRepository.editProduct(event.productModel);
      emit(ProductEdited());
    } catch (e) {
      emit(EditProductDetailsError(message: e.toString()));
    }
  }
}
