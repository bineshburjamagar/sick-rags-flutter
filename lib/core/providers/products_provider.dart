import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  FirebaseFirestore database = FirebaseFirestore.instance;
  getProductsData() async {
    var productsModel = await database.collection('products').get();

    for (var element in productsModel.docs) {
      log(element.data().toString());
    }
  }
}
