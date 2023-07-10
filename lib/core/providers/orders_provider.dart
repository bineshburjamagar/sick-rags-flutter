import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/core/models/orders_model.dart';

class OrdersProvider extends ChangeNotifier {
  List<OrdersModel> orderList = [];

  getOrders() async {
    var data = await FirebaseFirestore.instance.collection('orders').get();
    for (var element in data.docs) {
      log(element.data()['orders'].toString());

      for (var e in element.data()['orders'] as List) {
        orderList.add(
          OrdersModel(
              productId: e['productId'],
              quantity: e['quantity'],
              orderStatus: 'pending',
              price: e['quantity'] * e['price']),
        );
      }

      notifyListeners();
    }
  }
}
