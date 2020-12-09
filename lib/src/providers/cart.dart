import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String productTitle;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.productTitle,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems;
  Map<String, CartItem> get items {
    return {..._cartItems};
  }

  void addItem(String id, String productTitle, double price) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
          id,
          (value) => CartItem(
              id: id,
              productTitle: productTitle,
              quantity: value.quantity + 1,
              price: price));
    } else {
      _cartItems.putIfAbsent(
          id,
          () => CartItem(
              id: id, productTitle: productTitle, quantity: 1, price: price));
    }
    notifyListeners();
  }
}
