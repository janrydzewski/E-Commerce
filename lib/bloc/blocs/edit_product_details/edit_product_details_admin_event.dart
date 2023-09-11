part of 'edit_product_details_admin_bloc.dart';

class EditProductDetailsAdminEvent {
  const EditProductDetailsAdminEvent();
}

class EditProductEvent extends EditProductDetailsAdminEvent {
  final ProductModel productModel;

  const EditProductEvent(this.productModel);
}

class EditPhotoAdminDetailsEvent extends EditProductDetailsAdminEvent {
  final XFile file;

  const EditPhotoAdminDetailsEvent(this.file);
}
