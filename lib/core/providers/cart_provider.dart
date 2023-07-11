import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/core/models/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];

  getCartList() async {
    cartList.clear();
    var data = await FirebaseFirestore.instance
        .collection('cart')
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser?.uid,
        )
        .get();

    var dd = data.docs.firstOrNull;

    if (dd != null) {
      cartList = CartModelMeta.fromJson(dd.data()).cartList;
      notifyListeners();
    }

    getTotalPrice(cartList);

    notifyListeners();
  }

  getTotalPrice(List<CartModel> cartList) {
    double total = 0.0;

    for (var product in cartList) {
      total += product.quantity * product.price;
    }

    return total;
  }

  increaseQuantity(int q) {
    return q++;
  }

  decreaseQuantity(int q) {
    return q > 1 ? q-- : 1;
  }

  Future<void> deleteAllCart() async {
    var currentCart = await FirebaseFirestore.instance
        .collection("cart")
        .where(
          "userId",
          isEqualTo: FirebaseAuth.instance.currentUser?.uid,
        )
        .get();

    FirebaseFirestore.instance
        .collection('cart')
        .doc(currentCart.docs.firstOrNull?.id)
        .delete();
  }
}
