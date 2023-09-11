import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCartModel{
  String id;
  String name;
  String price;
  String photoUrl;
  String size;
  String color;
  String quantity;
  String finalPrice;
  String category;

  ProductCartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.photoUrl,
    required this.size,
    required this.color,
    required this.quantity,
    required this.finalPrice,
    required this.category,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'photoUrl': photoUrl,
    'size': size,
    'color': color,
    'quantity': quantity,
    'finalPrice': finalPrice,
    'category': category,

  };

  static ProductCartModel fromSnap(DocumentSnapshot snapshot) {
    return ProductCartModel(
      id: snapshot['id'],
      name: snapshot['name'],
      price: snapshot['price'],
      photoUrl: snapshot['photoUrl'],
      size: snapshot['size'],
      color: snapshot['color'],
      quantity: snapshot['quantity'],
      finalPrice: snapshot['finalPrice'],
      category: snapshot['category'],
    );
  }
}