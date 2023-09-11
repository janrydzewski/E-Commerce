import 'package:bloc/bloc.dart';
import 'package:ecommerce/data/models/models.dart';

import 'package:ecommerce/repositories/repositories.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'add_address_event.dart';

part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final AddressRepository addressRepository;

  AddAddressBloc({required this.addressRepository}) : super(const AddAddressState()) {
    on<GetUserLocationEvent>(_onGetUserLocationEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
    on<AddUserAddressEvent>(_onAddUserAddressEvent);
  }

  _onGetUserLocationEvent(
      GetUserLocationEvent event, Emitter<AddAddressState> emit) async {
    emit(AddressLoading());
    final position = await addressRepository.getCurrentPosition();
    final latitude = position!.latitude;
    final longitude = position.longitude;
    final address = await placemarkFromCoordinates(latitude, longitude);
    print(address[0].toString());
    emit(state.copyWith(
      latitude: latitude,
      longitude: longitude,
      zoom: 16,
      address: address,
      type: false,
      markers: {
        Marker(
            markerId: const MarkerId("0"),
            position: LatLng(latitude, longitude))
      },
    ));
  }

  _onSearchUserEvent(SearchUserEvent event, Emitter<AddAddressState> emit) async {
    emit(AddressLoading());
    try {
      final address = await addressRepository.searchUserLocation(event.address);
      print(address.toString());
      emit(state.copyWith(
        latitude: address?.latitude,
        longitude: address?.longitude,
        zoom: 16,
        address: const [],
        type: true,
        markers: {
          Marker(
              markerId: const MarkerId("0"),
              position: LatLng(address!.latitude, address.longitude))
        },
      ));
    } catch (error) {
      emit(AddAddressError(
        latitude: null,
        longitude: null,
        zoom: 11,
        address: const [],
        type: false,
        markers: {},
        message: 'Please enter all the fields',
      ));
    }
  }

  _onAddUserAddressEvent(
      AddUserAddressEvent event, Emitter<AddAddressState> emit) async {
    emit(AddressLoading());
    await addressRepository.addUserLocation(AddressModel(name: event.name, latitude: event.latitude, longitude: event.longitude, address: event.address)
        );
  }
}
