part of 'edit_product_details_admin_bloc.dart';

class EditProductDetailsAdminState extends Equatable {
  final XFile file;
  final bool isLoaded;

  EditProductDetailsAdminState({XFile? file, bool? isLoaded})
      : file = file ?? XFile(""),
        isLoaded = isLoaded ?? true;

  EditProductDetailsAdminState copyWith({
    XFile? file,
    bool? isLoaded,
  }) {
    return EditProductDetailsAdminState(
      file: file ?? this.file,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object> get props => [file, isLoaded];
}

class ProductEdited extends EditProductDetailsAdminState {}

class EditProductDetailsError extends EditProductDetailsAdminState {
  final String message;

  EditProductDetailsError({
    XFile? file,
    bool? isLoaded,
    required this.message,
  }) : super(
          file: file,
          isLoaded: isLoaded,
        );
}
