import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  getData() {
    user = FirebaseAuth.instance.currentUser;
    notifyListeners();
  }
}
