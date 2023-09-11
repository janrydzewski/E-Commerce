import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/resources/resources.dart';
import 'package:ecommerce/data/models/models.dart';

class OrdersRepository {
  final FirebaseFirestore firebaseFirestore;

  OrdersRepository({required this.firebaseFirestore});

  Future<List<ProductOrderModel>> getProducts(String type) async {
    List<ProductOrderModel> productList = [];

    try {
      final productCollection = await firebaseFirestore
          .collection('orders')
          .where("uid", isEqualTo: firebaseAuth.currentUser?.uid)
          .where("type", isEqualTo: type)
          .orderBy("date", descending: true)
          .get();
      productCollection.docs.forEach((element) {
        return productList.add(ProductOrderModel.fromSnap(element));
      });
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addProductsToOrders(
      List<ProductCartModel> productCartModels) async {
    List<ProductOrderModel> productList = [];

    try {
      for (var product in productCartModels) {
        productList.add(ProductOrderModel(
            id: product.id,
            name: product.name,
            uid: firebaseAuth.currentUser!.uid,
            photoUrl: product.photoUrl,
            size: product.size,
            color: product.color,
            quantity: product.quantity,
            finalPrice: product.finalPrice,
            category: product.category,
            date: Timestamp.fromDate(DateTime.now().toUtc()),
            ));
      }

      for (var product in productList) {
        firebaseFirestore.collection('orders').add(product.toJson());
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
