// lib/provider/cart_provider.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/ServecisModel.dart';

final cartProvider = ChangeNotifierProvider<CartProvider>((ref) {
  return CartProvider();
});

class CartProvider extends ChangeNotifier {
  final List<Service1> _cartItems = [];

  List<Service1> get cartItems => _cartItems;

  void addService(Service1 service) {
    _cartItems.add(service);
    notifyListeners();
  }

  void removeService(Service1 service) {
    _cartItems.remove(service);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  // حفظ الحجوزات في Firestore
  Future<void> confirmBooking() async {
    for (var service in _cartItems) {
      await FirebaseFirestore.instance.collection('bookings').add({
        'serviceName': service.name,
        'description': service.description,
        'image': service.image,
        'price': service.price,
        'date': service.date?.toIso8601String(),
        'time': '${service.time?.hour}:${service.time?.minute}',
      });
    }
    _cartItems.clear();
    notifyListeners();
  }
}
