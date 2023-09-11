import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AddressRepository {
  final FirebaseFirestore firebaseFirestore;

  const AddressRepository({required this.firebaseFirestore});

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      //snackBarError(context, "Location services are disabled. Please enable the services");
      print("Location services are disabled. Please enable the services");
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        //snackBarError(context, "Location permissions are denied");
        print("Location permissions are denied");

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      //snackBarError(context, "Location permissions are permanently denied, we cannot request permissions.");
      print(
          "Location permissions are permanently denied, we cannot request permissions.");
      return false;
    }
    return true;
  }

  Future<Position?> getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return null;
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  Future<Location?> searchUserLocation(String address) async {
    final location = await locationFromAddress(address);
    return location[0];
  }

  Future<void> addUserLocation(AddressModel addressModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser?.uid)
        .collection("address")
        .add(addressModel.toJson());
  }

  Future<List<AddressModel>> getAddresses() async {
    List<AddressModel> addressList = [];

    try {
      final addressCollection = await firebaseFirestore
          .collection('users')
          .doc(firebaseAuth.currentUser?.uid)
          .collection('address')
          .get();
      addressCollection.docs.forEach((element) {
        addressList.add(AddressModel.fromSnap(element));
      });
      return addressList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
