import 'package:cloud_firestore/cloud_firestore.dart';

class ProductOrderModel{
  String id;
  String name;
  String uid;
  String photoUrl;
  String size;
  String color;
  String quantity;
  String finalPrice;
  String type;
  String category;
  Timestamp date;

  ProductOrderModel({
    required this.id,
    required this.name,
    required this.uid,
    required this.photoUrl,
    required this.size,
    required this.color,
    required this.quantity,
    required this.finalPrice,
    this.type = "ongoing",
    required this.category,
    required this.date,

  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'uid': uid,
    'photoUrl': photoUrl,
    'size': size,
    'color': color,
    'quantity': quantity,
    'finalPrice': finalPrice,
    'type': type,
    'category': category,
    'date': date,

  };

  static ProductOrderModel fromSnap(DocumentSnapshot snapshot) {
    return ProductOrderModel(
        id: snapshot['id'],
        name: snapshot['name'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        size: snapshot['size'],
        color: snapshot['color'],
        quantity: snapshot['quantity'],
        finalPrice: snapshot['finalPrice'],
        type: snapshot['type'],
        category: snapshot['category'],
        date: snapshot['date']
    );
  }
}