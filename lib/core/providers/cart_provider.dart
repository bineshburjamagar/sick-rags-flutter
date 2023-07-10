import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/core/models/models.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];

  getCartList() async {
    var data = await FirebaseFirestore.instance.collection('cart').get();
    for (var element in data.docs) {
      cartList.add(
        CartModel(
          productId: element.data()['productId'],
          quantity: element.data()['quantity'],
        ),
      );
    }
  }
}
