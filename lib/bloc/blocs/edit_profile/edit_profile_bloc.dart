import 'package:bloc/bloc.dart';

import 'package:image_picker/image_picker.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';

part 'edit_profile_event.dart';

part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final UserRepository userRepository;

  EditProfileBloc({required this.userRepository}) : super(EditProfileState()) {
    on<EditProfileDetailsEvent>(_onEditProfileDetailsEvent);
    on<EditPhotoEvent>(_onEditPhotoEvent);
  }

  _onEditPhotoEvent(
      EditPhotoEvent event, Emitter<EditProfileState> emit) async {
    try {
      emit(state.copyWith(file: event.file, isLoaded: true));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  _onEditProfileDetailsEvent(
      EditProfileDetailsEvent event, Emitter<EditProfileState> emit) async {
    try {
      await userRepository.updateUser(event.userModel);
      emit(ProfileEdited());
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
