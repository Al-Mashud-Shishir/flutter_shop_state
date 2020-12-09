import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String productTitle;
  final int quantity;
  final double price;
  String imageUrl;

  CartItem(
      {@required this.id,
      @required this.productTitle,
      @required this.quantity,
      @required this.price,
      this.imageUrl = ""});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};
  Map<String, CartItem> get items {
    return {..._cartItems};
  }

  void addItem(String id, String productTitle, double price, String image) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
          id,
          (value) => CartItem(
              id: id,
              productTitle: productTitle,
              quantity: value.quantity + 1,
              price: price,
              imageUrl: image));
    } else {
      _cartItems.putIfAbsent(
          id,
          () => CartItem(
              id: id,
              productTitle: productTitle,
              quantity: 1,
              price: price,
              imageUrl: image));
    }
    notifyListeners();
  }

  int getQuantity(String id) {
    if (_cartItems.containsKey(id)) {
      return _cartItems[id].quantity;
    }
    return 0;
  }

  void deleteItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;
    items.forEach((k, v) => total += v.price * v.quantity);
    return total;
  }

  int get totalQuantityCart {
    int total = 0;
    items.forEach((k, v) => total += v.quantity);
    return total;
  }

  void deleteQuantity(String id) {
    int curQuantity = _cartItems[id].quantity;
    String title = _cartItems[id].productTitle;
    double price = _cartItems[id].price;
    if (curQuantity > 0) {
      _cartItems.update(
          id,
          (value) => CartItem(
              id: id,
              productTitle: title,
              quantity: value.quantity - 1,
              price: price,
              imageUrl: value.imageUrl));
      curQuantity -= 1;
    }
    if (curQuantity == 0) {
      _cartItems.remove(id);
    }
    notifyListeners();
  }
}
