import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_product_event.dart';

part 'show_product_state.dart';

class ShowProductBloc extends Bloc<ShowProductEvent, ShowProductState> {
  ShowProductBloc() : super(const ShowProductState()) {
    on<ChangeSizeEvent>(_onChangeSizeEvent);
    on<ChangeColorEvent>(_onChangeColorEvent);
    on<IncreaseQuantityEvent>(_onIncreaseQuantityEvent);
    on<DecreaseQuantityEvent>(_onDecreaseQuantityEvent);
  }

  _onChangeSizeEvent(ChangeSizeEvent event, Emitter<ShowProductState> emit) {
    emit(state.copyWith(sizeIndex: event.sizeIndex));
  }

  _onChangeColorEvent(ChangeColorEvent event, Emitter<ShowProductState> emit) {
    emit(state.copyWith(colorIndex: event.colorIndex));
  }

  _onIncreaseQuantityEvent(
      IncreaseQuantityEvent event, Emitter<ShowProductState> emit) {
    emit(state.copyWith(
        quantity: event.quantity + 1,
        finalPrice: (event.quantity + 1) * event.price));
  }

  _onDecreaseQuantityEvent(
      DecreaseQuantityEvent event, Emitter<ShowProductState> emit) {
    emit(state.copyWith(
        quantity:
            (event.quantity - 1) < 0 ? event.quantity : event.quantity - 1,
        finalPrice:
            ((event.quantity - 0) < 1 ? event.quantity : event.quantity - 1) *
                event.price));
  }
}
