import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;

  const CustomTextForm({super.key, required this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap, // دالة يتم تمريرها من الخارج
      onTapOutside: (event) {
        // لإخفاء الكيبورد عند الضغط خارج الحقل
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.person, color: Colors.white70),
        hintText: name,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
