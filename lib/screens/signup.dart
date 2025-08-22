import 'package:flutter/material.dart';
import 'package:salon_app/widget/CostumTextForm.dart';

import 'login.dart'; // تأكد من استيراد صفحة Login

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color.fromARGB(255, 168, 100, 175)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // شعار
                Image.asset('assets/salon.png', height: 200),
                const SizedBox(height: 40),

                // عنوان
                const Text(
                  "Create your account",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 40),

                // حقول التسجيل
                CustomTextForm(name: "Name", onTap: () {}),
                const SizedBox(height: 20),
                CustomTextForm(name: "Email", onTap: () {}),
                const SizedBox(height: 20),
                CustomTextForm(name: "Password", onTap: () {}),
                const SizedBox(height: 20),
                CustomTextForm(name: "Confirm Password", onTap: () {}),
                const SizedBox(height: 20),

                // زر تسجيل الحساب مع إعادة المستخدم إلى Login
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 168, 100, 175),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
