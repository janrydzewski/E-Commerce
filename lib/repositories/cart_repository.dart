import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/data/models/models.dart';
import 'package:ecommerce/resources/constants/constants.dart';

class CartRepository {
  final FirebaseFirestore firebaseFirestore;

  CartRepository({required this.firebaseFirestore});

  Future<List<ProductCartModel>> getCartProducts(String uid) async {
    List<ProductCartModel> productCartList = [];

    try {
      final cartCollection = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .get();
      cartCollection.docs.forEach((element) {
        productCartList.add(ProductCartModel.fromSnap(element));
      });
      return productCartList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int?> getCartPrice(String uid) async {
    int cartPrice = 0;

    try {
      final cartColelection = await firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .get();
      cartColelection.docs.forEach((element) {
        cartPrice += int.parse(ProductCartModel.fromSnap(element).finalPrice);
      });
      return cartPrice;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteProductFromCart(String uid, String id) async {
    try {
      final productCartDoc = firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(id);
      await firebaseFirestore.runTransaction((transaction) async {
        transaction.delete(productCartDoc);
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> clearCart() async {

    List<ProductCartModel> products = await getCartProducts(firebaseAuth.currentUser!.uid);

    for(var product in products){
      try {
        final productCartDoc = firebaseFirestore
            .collection('users')
            .doc(firebaseAuth.currentUser!.uid)
            .collection('cart')
            .doc(product.id);
        await firebaseFirestore.runTransaction((transaction) async {
          transaction.delete(productCartDoc);
        });
      } catch (e) {
        throw Exception(e.toString());
      }
    }

  }

  Future<void> updateProductInCart(
      String uid, String id, String quantity, String finalPrice) async {
    try {
      final productCartDoc = firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(id);
      await firebaseFirestore.runTransaction((transaction) async {
        transaction.update(productCartDoc, {
          'quantity': quantity,
          'finalPrice': finalPrice,
        });
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>?> getCartProductDetails(String uid, String id) async {
    try {
      final productCartDoc = firebaseFirestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(id);
      final result =
          await firebaseFirestore.runTransaction((transaction) async {
        final snapshot = await transaction.get(productCartDoc);
        final quantity = snapshot.get('quantity').toString();
        final finalPrice = snapshot.get('finalPrice').toString();

        return [quantity, finalPrice];
      });
      return result.cast<String>();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
