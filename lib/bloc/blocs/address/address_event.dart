part of 'address_bloc.dart';

class AddressEvent {
  const AddressEvent();
}

class GetAddressEvent extends AddressEvent{
  const GetAddressEvent();
}

class ChangeIndexEvent extends AddressEvent{
  final int newIndex;
  const ChangeIndexEvent(this.newIndex);
}
