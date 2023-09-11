import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ChangePageViewEvent>(_onChangePageViewEvent);
    on<ChangeCategoryEvent>(_onChangeCategoryEvent);
  }

  _onChangePageViewEvent(ChangePageViewEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(pageViewIndex: event.newIndex));
  }

  _onChangeCategoryEvent(ChangeCategoryEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(categoryIndex: event.newIndex));
  }
}
