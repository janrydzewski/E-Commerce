import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  late StreamSubscription<UserModel> userSubscription;

  UserBloc({required this.userRepository})
      : super(const UserState(userStatus: UserStatus.initial)) {
    on<UserDataChanged>(_onUserDataChanged);
    userSubscription = userRepository
        .getUserStream(firebaseAuth.currentUser!.uid)
        .listen((userModel) {
      print(userModel.toString());
      add(UserDataChanged(userModel));
    });
  }

  void _onUserDataChanged(UserDataChanged event, Emitter<UserState> emit) {
    emit(event.userData.id.isNotEmpty
        ? state.copyWith(
            userStatus: UserStatus.loaded, userModel: event.userData)
        : state.copyWith(userStatus: UserStatus.loading));
  }

  @override
  Future<void> close() {
    userSubscription.cancel();
    return super.close();
  }
}
