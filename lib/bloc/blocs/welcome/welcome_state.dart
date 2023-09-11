part of 'welcome_bloc.dart';

class WelcomeState {
  int index;

  WelcomeState({this.index = 0});

  WelcomeState copyWith({
    int? index,
  }) {
    return WelcomeState(
      index: index ?? this.index,
    );
  }
}
