import 'package:flutter/material.dart';
import 'package:salon_app/model/ServecisModel.dart';

class Booking {
  final String serviceName;
  final String description;
  final String image;
  final double price;
  final DateTime date;
  final TimeOfDay time;
  final String? userId;

  Booking({
    required this.serviceName,
    required this.description,
    required this.image,
    required this.price,
    required this.date,
    required this.time,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      "serviceName": serviceName,
      "description": description,
      "image": image,
      "price": price,
      "date": date.toIso8601String(),
      "time": "${time.hour}:${time.minute}",
      "userId": userId,
    };
  }

  // تحويل من Service1 إلى Booking
  factory Booking.fromService(Service1 service) {
    return Booking(
      serviceName: service.name,
      description: service.description,
      image: service.image,
      price: service.price,
      date: service.date ?? DateTime.now(),
      time: service.time ?? TimeOfDay.now(),
    );
  }
}
