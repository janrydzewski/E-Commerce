import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/repositories/repositories.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'address_event.dart';

part 'address_state.dart';

class AddressBloc extends HydratedBloc<AddressEvent, AddressState> {
  final AddressRepository addressRepository;

  AddressBloc({required this.addressRepository}) : super(AddressState(index: 0)) {
    on<GetAddressEvent>(_onGetAddressEvent);
    on<ChangeIndexEvent>(_onChangeIndexEvent);
  }

  _onGetAddressEvent(GetAddressEvent event, Emitter<AddressState> emit) async {
    try {
      final addressList = await addressRepository.getAddresses();

      emit(state.copyWith(addressList: addressList, isLoaded: true));
    } catch (e) {
      emit(AddressError(message: e.toString()));
    }
  }

  _onChangeIndexEvent(ChangeIndexEvent event, Emitter<AddressState> emit) async {
    emit(state.copyWith(index: event.newIndex));
  }

  @override
  AddressState? fromJson(Map<String, dynamic> json) {
   return AddressState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AddressState state) {
    return state.toJson();
  }
}
