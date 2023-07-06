import 'package:flutter/material.dart';
import 'package:sick_rags_flutter/screens/nav_page/home_page.dart';
import 'package:sick_rags_flutter/screens/nav_page/profile_page.dart';

class BasePageProvider extends ChangeNotifier {
  int initialIndex = 0;
  List<Widget> screen = [
    const HomePage(),
    const Text('data'),
    const ProfilePage(),
  ];

  changeIndex(int index) {
    initialIndex = index;
    notifyListeners();
  }
}
