import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/core/models/models.dart';

class ProductsProvider extends ChangeNotifier {
  List<ProductModel> productsList = [];
  List<ProductModel> popularProducts = [];
  List<ProductModel> recentProducts = [];
  FirebaseFirestore database = FirebaseFirestore.instance;
  getProductsData() async {
    var productsModel =
        await database.collection('products').orderBy('id').get();

    for (var element in productsModel.docs) {
      productsList.add(
        ProductModel(
          id: element.data()['id'],
          name: element['name'],
          price: element.data()['price'],
          availableSize: element.data()['available_size'],
          isPopular: element.data()['is_popular'],
          isRecent: element.data()['is_recent'],
          images: element.data()['images'],
          description: element.data()['description'],
        ),
      );

      notifyListeners();
    }
    popularProducts =
        productsList.where((element) => element.isPopular).toList();
    recentProducts = productsList.where((element) => element.isRecent).toList();
    notifyListeners();
  }
}
