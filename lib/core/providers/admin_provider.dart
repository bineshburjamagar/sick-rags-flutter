import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  final idController = TextEditingController();
  final imageController = TextEditingController();
  final List<String> images = [];
  final titleController = TextEditingController();

  getImages(String img) {
    images.add(img);
    imageController.clear();
    notifyListeners();
  }

  removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }
}
