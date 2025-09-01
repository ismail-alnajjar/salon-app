import 'package:flutter/material.dart';

class Service1 {
  final String name;
  final String description;
  final String image;
  final double price;
  final DateTime? date; // تاريخ الحجز
  final TimeOfDay? time; // وقت الحجز

  Service1({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    this.date,
    this.time,
  });

  // نسخ الخدمة مع تعديل التاريخ والوقت
  Service1 copyWith({DateTime? date, TimeOfDay? time}) {
    return Service1(
      name: name,
      description: description,
      image: image,
      price: price,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
