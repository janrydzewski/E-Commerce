part of 'add_address_bloc.dart';

class AddAddressEvent {
  const AddAddressEvent();
}

class GetUserLocationEvent extends AddAddressEvent {
  const GetUserLocationEvent();
}

class SearchUserEvent extends AddAddressEvent {
  final String address;
  const SearchUserEvent(this.address);
}

class AddUserAddressEvent extends AddAddressEvent {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  AddUserAddressEvent(this.name, this.address, this.latitude, this.longitude);
}