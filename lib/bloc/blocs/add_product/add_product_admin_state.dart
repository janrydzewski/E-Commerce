part of 'add_product_admin_bloc.dart';

class AddProductAdminState extends Equatable {
  final XFile file;
  final bool isLoaded;

  AddProductAdminState({XFile? file, bool? isLoaded})
      : file = file ?? XFile(""),
        isLoaded = isLoaded ?? true;

  AddProductAdminState copyWith({
    XFile? file,
    bool? isLoaded,
  }) {
    return AddProductAdminState(
      file: file ?? this.file,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object> get props => [file, isLoaded];
}

class ProductAdminAdded extends AddProductAdminState {}

class ProductAdminError extends AddProductAdminState {
  final String message;

  ProductAdminError({
    XFile? file,
    bool? isLoaded,
    required this.message,
  }) : super(
          file: file,
          isLoaded: isLoaded,
        );
}
