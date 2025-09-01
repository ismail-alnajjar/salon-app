import 'package:flutter/material.dart';
import 'package:salon_app/model/Bookingsmodels.dart';
import 'package:salon_app/model/ServecisModel.dart';

bool isDarkMode = false;
final gradientColors = isDarkMode
    ? [Color.fromARGB(255, 247, 244, 244), Color.fromARGB(255, 10, 10, 10)]
    : [Color.fromARGB(255, 15, 15, 15), Color.fromARGB(255, 246, 245, 246)];

class Cart {
  static List<Service1> items = []; // السلة الحالية
  static List<Booking> bookings = []; // الحجوزات المؤكدة

  static double get totalPrice =>
      items.fold(0, (sum, item) => sum + item.price);
}
