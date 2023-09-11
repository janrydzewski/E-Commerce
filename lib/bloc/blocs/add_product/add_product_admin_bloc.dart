import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecommerce/repositories/repositories.dart';

part 'add_product_admin_event.dart';

part 'add_product_admin_state.dart';

class AddProductAdminBloc
    extends Bloc<AddProductAdminEvent, AddProductAdminState> {
  final AdminRepository adminRepository;

  AddProductAdminBloc({required this.adminRepository})
      : super(AddProductAdminState()) {
    on<AddProductAdminEEvent>(_onAddProductEvent);
    on<AddPhotoEvent>(_onAddPhotoEvent);
  }

  _onAddPhotoEvent(
      AddPhotoEvent event, Emitter<AddProductAdminState> emit) async {
    try {
      emit(state.copyWith(file: event.file, isLoaded: true));
    } catch (e) {
      emit(ProductAdminError(message: e.toString()));
    }
  }

  _onAddProductEvent(
      AddProductAdminEEvent event, Emitter<AddProductAdminState> emit) async {
    try {
      await adminRepository.addProduct(event.productModel);
      emit(ProductAdminAdded());
    } catch (e) {
      emit(ProductAdminError(message: e.toString()));
    }
  }
}
