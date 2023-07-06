import 'package:flutter/material.dart';

class AdminProvider extends ChangeNotifier {
  final idController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();
  final List<String> images = [];
  final sizesController = TextEditingController();
  final List<String> sizes = [];
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();
  bool? isPopular = false;
  bool? isRecent = false;

  clearData() {
    idController.clear();
    priceController.clear();
    imageController.clear();
    images.clear();
    sizesController.clear();
    sizes.clear();
    descriptionController.clear();
    isPopular = false;
    isRecent = false;
    titleController.clear();
    notifyListeners();
  }

  getImages(String img) {
    images.add(img);
    imageController.clear();
    notifyListeners();
  }

  removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }

  getSizes(String size) {
    sizes.add(size);
    sizesController.clear();
    notifyListeners();
  }

  removeSize(int index) {
    sizes.removeAt(index);
    notifyListeners();
  }

  isRecentProduct(bool? r) {
    isRecent = r;
    notifyListeners();
  }

  isPopularProduct(bool? p) {
    isPopular = p;
    notifyListeners();
  }
}
