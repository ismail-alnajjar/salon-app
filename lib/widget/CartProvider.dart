import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<String> _cartItems = [];

  List<String> get cartItems => _cartItems;

  int get count => _cartItems.length;

  void addService(String serviceName) {
    _cartItems.add(serviceName);
    notifyListeners();
  }

  void removeService(String serviceName) {
    _cartItems.remove(serviceName);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
