import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/models/models.dart';

class AdminRepository {
  final FirebaseFirestore firebaseFirestore;

  AdminRepository({required this.firebaseFirestore});

  Future<void> addProduct(ProductModel productModel) async {
    try {
      await firebaseFirestore
          .collection('products')
          .add(productModel.toJson())
          .then((DocumentReference doc) async {
        await firebaseFirestore
            .collection('products')
            .doc(doc.id)
            .update({"id": doc.id});
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> editProduct(ProductModel productModel) async {
    try {
      await firebaseFirestore
          .collection('products')
          .doc(productModel.id)
          .update({
        'name': productModel.name,
        'opinion': productModel.opinion,
        'soldCounter': productModel.soldCounter,
        'price': productModel.price,
        'photoUrl': productModel.photoUrl,
        'category': productModel.category,
        'description': productModel.description,
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> productList = [];

    try {
      final productCollection =
          await firebaseFirestore.collection('products').get();
      productCollection.docs.forEach((element) {
        productList.add(ProductModel.fromSnap(element));
      });
      return productList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
