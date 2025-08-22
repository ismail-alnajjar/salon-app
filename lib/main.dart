import 'package:flutter/material.dart';
import 'package:salon_app/screens/login.dart';

void main() {
  runApp(const SalonApp());
}

class SalonApp extends StatelessWidget {
  const SalonApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Login());
  }
}
