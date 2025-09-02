import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // للتأكد من أن كل شيء جاهز قبل Firebase
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(const ProviderScope(child: SalonApp())); // إذا تستخدم Riverpod
}

class SalonApp extends StatelessWidget {
  const SalonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
