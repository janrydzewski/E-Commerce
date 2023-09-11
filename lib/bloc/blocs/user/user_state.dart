part of 'user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState {
  final UserStatus userStatus;
  final UserModel? userModel;
  final String message;

  const UserState(
      {required this.userStatus, this.userModel, this.message = ""});

  UserState copyWith({
    UserStatus? userStatus,
    UserModel? userModel,
    String? message,
  }) {
    return UserState(
      userStatus: userStatus ?? this.userStatus,
      userModel: userModel ?? this.userModel,
      message: message ?? this.message,
    );
  }
}
