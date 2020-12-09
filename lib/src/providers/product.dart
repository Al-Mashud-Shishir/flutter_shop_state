import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  int quatityLeft;
  int quantityChoosen;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.quatityLeft,
      this.quantityChoosen,
      @required this.price,
      @required this.imageUrl,
      this.isFavourite = false});
  void toggleFavourite() {
    this.isFavourite = !this.isFavourite;
    notifyListeners();
  }
}
