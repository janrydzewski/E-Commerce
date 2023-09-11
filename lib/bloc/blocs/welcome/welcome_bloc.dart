import 'package:bloc/bloc.dart';

part 'welcome_event.dart';

part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState(index: 0)) {
    on<WelcomeEvent>(_onChangeIndexEvent);
  }

  _onChangeIndexEvent(WelcomeEvent event, Emitter<WelcomeState> emit) {
    emit(state.copyWith(index: state.index));
  }
}
