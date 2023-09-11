import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String name;
  double latitude;
  double longitude;
  String address;

  AddressModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'address': address,
      };

  static AddressModel fromSnap(DocumentSnapshot snapshot) {
    return AddressModel(
      name: snapshot['name'],
      latitude: snapshot['latitude'],
      longitude: snapshot['longitude'],
      address: snapshot['address'],
    );
  }
}
