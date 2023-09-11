part of 'add_address_bloc.dart';

class AddAddressState {
  final double latitude;
  final double longitude;
  final double zoom;
  final List<Placemark> address;
  final bool type;
  final Set<Marker> markers;

  const AddAddressState({
    this.latitude = 52.23224479889518,
    this.longitude = 21.015192630645668,
    this.zoom = 11,
    this.address = const [],
    this.type = false,
    this.markers = const {},
  });

  AddAddressState copyWith({
    double? latitude,
    double? longitude,
    double? zoom,
    List<Placemark>? address,
    bool? type,
    Set<Marker>? markers,
  }) {
    return AddAddressState(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      zoom: zoom ?? this.zoom,
      address: address ?? this.address,
      type: type ?? this.type,
      markers: markers ?? this.markers,
    );
  }
}

class AddressLoading extends AddAddressState {}

class AddAddressError extends AddAddressState {
  final String message;

  AddAddressError({
    double? latitude,
    double? longitude,
    double? zoom,
    List<Placemark>? address,
    bool? type,
    Set<Marker>? markers,
    required this.message,
  }) : super(
          latitude: latitude ?? 52.23224479889518,
          longitude: longitude ?? 21.015192630645668,
          zoom: zoom ?? 11,
          address: address ?? const [],
          type: type ?? false,
          markers: markers ?? const {},
        );
}
