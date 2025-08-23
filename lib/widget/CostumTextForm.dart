import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String name;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback? onTap;
  final String? errorText;
  final Widget? suffixIcon; // ← أضفنا هذا الباراميتر

  const CustomTextForm({
    super.key,
    required this.name,
    this.controller,
    this.obscureText = false,
    this.onTap,
    this.errorText,
    this.suffixIcon, // ← يمكنك تمريرها عند الإنشاء
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (name.toLowerCase().contains('email')) {
      icon = Icons.email;
    } else if (name.toLowerCase().contains('password')) {
      icon = Icons.lock;
    } else {
      icon = Icons.person;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          onTap: onTap,
          obscureText: obscureText,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white70),
            hintText: name,
            hintStyle: const TextStyle(color: Colors.white70),
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.redAccent),
            suffixIcon: suffixIcon, // ← هنا استخدمنا الباراميتر
          ),
        ),
      ],
    );
  }
}
