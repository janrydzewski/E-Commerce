import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/models.dart';

class ProductRepository {
  final FirebaseFirestore firebaseFirestore;

  ProductRepository({required this.firebaseFirestore});

  Future<List<ProductModel>> getProducts(String category) async {
    List<ProductModel> productList = [];

    try {
      final productCollection =
          await firebaseFirestore.collection('products').get();
      productCollection.docs.forEach((element) {
        if (element.data()['category'] == category || category == "") {
          return productList.add(ProductModel.fromSnap(element));
        }
      });
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addProductToCart(
      ProductCartModel productCartModel, String uid) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productCartModel.id)
          .set(productCartModel.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
