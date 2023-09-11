import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String id;
  String name;
  String opinion;
  String soldCounter;
  String price;
  String photoUrl;
  String category;
  String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.opinion,
    required this.soldCounter,
    required this.price,
    required this.photoUrl,
    required this.category,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
      'id': id,
      'name': name,
      'opinion': opinion,
      'soldCounter': soldCounter,
      'price': price,
      'photoUrl': photoUrl,
      'category': category,
      'description': description,

  };

  static ProductModel fromSnap(DocumentSnapshot snapshot) {
    return ProductModel(
      id: snapshot['id'],
      name: snapshot['name'],
      opinion: snapshot['opinion'],
      soldCounter: snapshot['soldCounter'],
      price: snapshot['price'],
      photoUrl: snapshot['photoUrl'],
      category: snapshot['category'],
      description: snapshot['description'],
    );
  }
}