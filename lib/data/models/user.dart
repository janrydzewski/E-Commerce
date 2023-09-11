import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String fullName;
  String userName;
  String birthDate;
  String email;
  String phoneNumber;
  String gender;
  String profilePhoto;
  String country;

  UserModel({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    required this.profilePhoto,
    required this.country,
  });

  Map<String, dynamic> toJson() =>{
      'id': id,
      'fullName': fullName,
      'userName': userName,
      'birthDate': birthDate,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'profilePhoto': profilePhoto,
      'country': country,
  };


  static UserModel fromSnap(DocumentSnapshot snapshot) {
    return UserModel(
      id: snapshot['id'],
      fullName: snapshot['fullName'],
      userName: snapshot['userName'],
      birthDate: snapshot['birthDate'],
      email: snapshot['email'],
      phoneNumber: snapshot['phoneNumber'],
      gender: snapshot['gender'],
      profilePhoto: snapshot['profilePhoto'],
      country: snapshot['country'],
    );
  }

  @override
  String toString() {
    return 'UserModel{id: $id, fullName: $fullName, userName: $userName, birthDate: $birthDate, email: $email, phoneNumber: $phoneNumber, gender: $gender, profilePhoto: $profilePhoto, country: $country}';
  }
}