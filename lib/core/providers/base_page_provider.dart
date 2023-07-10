import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/screens/nav_page/nav_page.dart';

class BasePageProvider extends ChangeNotifier {
  int initialIndex = 0;
  String? banner;
  FirebaseFirestore database = FirebaseFirestore.instance;
  List<Widget> screen = [
    const HomePage(),
    const OrdersPage(),
    const ProfilePage(),
  ];

  changeIndex(int index) {
    initialIndex = index;
    notifyListeners();
  }

  getBanners() async {
    var bannerModel = await database.collection('banner').get();
    for (var element in bannerModel.docs) {
      banner = element.data()['image'];
      log(banner.toString());
      notifyListeners();
    }
  }
}
