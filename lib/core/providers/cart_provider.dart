import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/core/models/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];

  getCartList() async {
    cartList.clear();
    var data = await FirebaseFirestore.instance.collection('cart').get();
    for (var element in data.docs) {
      cartList.add(
        CartModel(
          docId: element.id,
          productId: element.data()['productId'],
          quantity: element.data()['quantity'],
          price: element.data()['price'],
        ),
      );
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
}
