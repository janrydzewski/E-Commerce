import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce/repositories/repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository})
      : super(const AuthState(authStatus: AuthStatus.unauthenticated)) {
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  _onSignInRequested(SignInRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      print("Sign In success: ${event.email} ${event.password}");
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, message: e.toString()));
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }
  }

  _onSignUpRequested(SignUpRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      await authRepository.signUp(email: event.email, password: event.password);
      print("Sign Up success: ${event.email} ${event.password}");
      emit(state.copyWith(authStatus: AuthStatus.authenticated));
    } catch (e) {
      emit(state.copyWith(authStatus: AuthStatus.error, message: e.toString()));
      emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
    }
  }

  _onSignOutRequested(SignOutRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    await authRepository.signOut();
    emit(state.copyWith(authStatus: AuthStatus.unauthenticated));
  }
}
