import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/resources.dart';

class UserRepository {
  final FirebaseFirestore firebaseFirestore;

  UserRepository({required this.firebaseFirestore});

  Future<UserModel> getUser(String uid) async {
    DocumentSnapshot userDoc =
        await firebaseFirestore.collection('users').doc(uid).get();
    Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
    return UserModel(
        id: uid,
        fullName: data['fullName'] ?? "",
        userName: data['userName'] ?? "",
        birthDate: data['birthDate'] ?? "",
        email: data['email'] ?? "",
        phoneNumber: data['phoneNumber'] ?? "",
        gender: data['gender'] ?? "",
        profilePhoto: data['profilePhoto'] ?? "",
        country: data['country'] ?? "");
  }

  Stream<UserModel> getUserStream(String uid) {
    return firebaseFirestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((snapshot) => UserModel.fromSnap(snapshot));
  }

  Future<void> updateUser(UserModel userModel) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .update({
      'fullName': userModel.fullName,
      'userName': userModel.userName,
      'birthDate': userModel.birthDate,
      'email': userModel.email,
      'phoneNumber': userModel.phoneNumber,
      'gender': userModel.gender,
      'profilePhoto': userModel.profilePhoto,
      'country': userModel.country,
    });
  }
}
