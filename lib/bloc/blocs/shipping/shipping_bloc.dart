
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends HydratedBloc<ShippingEvent, ShippingState> {
  ShippingBloc() : super(const ShippingState(index: 0)) {
    on<ChangeShippingIndexEvent>(_onChangeShippingIndexEvent);
  }

  _onChangeShippingIndexEvent(ChangeShippingIndexEvent event, Emitter<ShippingState> emit) async {
    emit(state.copyWith(index: event.newIndex));
  }

  @override
  ShippingState? fromJson(Map<String, dynamic> json) {
    return ShippingState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ShippingState state) {
    return state.toJson();
  }
}
