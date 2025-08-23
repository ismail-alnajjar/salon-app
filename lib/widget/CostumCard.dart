import 'package:flutter/material.dart';

class CostumCard extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final IconData icon;
  final bool isDarkMode;
  final VoidCallback onTap;

  const CostumCard({
    required this.title,
    required this.icon,
    required this.isDarkMode,
    this.height,
    this.width,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ألوان الكارد بناءً على الوضع
    final Color cardColor = isDarkMode
        ? const Color.fromARGB(255, 232, 230, 230).withOpacity(
            0.9,
          ) // داكن للدارك مود
        : const Color.fromARGB(
            255,
            248,
            246,
            246,
          ).withOpacity(0.9); // فاتح للوضع العادي
    final Color textColor = isDarkMode ? Colors.white : Colors.black87;
    final Color iconColor = isDarkMode ? Colors.white : Colors.black87;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 100,
        width: width ?? 160,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: const Color.fromARGB(95, 255, 255, 255),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(0, 5),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: iconColor, size: 28),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
