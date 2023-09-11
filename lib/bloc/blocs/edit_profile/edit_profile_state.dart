part of 'edit_profile_bloc.dart';

class EditProfileState {
  final XFile file;
  final bool isLoaded;

  EditProfileState({XFile? file, bool? isLoaded})
      : file = file ?? XFile(""),
        isLoaded = isLoaded ?? true;

  EditProfileState copyWith({
    XFile? file,
    bool? isLoaded,
  }) {
    return EditProfileState(
      file: file ?? this.file,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }
}

class ProfileEdited extends EditProfileState {}

class ProfileError extends EditProfileState {
  final String message;

  ProfileError({
    XFile? file,
    bool? isLoaded,
    required this.message,
  }) : super(
          file: file,
          isLoaded: isLoaded,
        );
}
