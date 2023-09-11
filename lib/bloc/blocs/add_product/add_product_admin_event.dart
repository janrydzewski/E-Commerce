part of 'add_product_admin_bloc.dart';

class AddProductAdminEvent {
  const AddProductAdminEvent();
}

class AddProductAdminEEvent extends AddProductAdminEvent {
  final ProductModel productModel;

  const AddProductAdminEEvent(this.productModel);
}

class AddPhotoEvent extends AddProductAdminEvent {
  final XFile file;

  const AddPhotoEvent(this.file);
}
