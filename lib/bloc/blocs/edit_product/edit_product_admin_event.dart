part of 'edit_product_admin_bloc.dart';

@immutable
abstract class EditProductAdminEvent {
  const EditProductAdminEvent();
}

class GetProductAdminEvent extends EditProductAdminEvent {
  const GetProductAdminEvent();
}
