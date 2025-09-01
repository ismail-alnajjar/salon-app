import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';

class CostumContainer extends StatelessWidget {
  const CostumContainer({
    super.key,
    required this.Name,
    required this.title1,
    required this.title2,
    this.width,
    this.onTap,
    this.height,
    this.height1,
    this.width1,
  });
  final String Name;
  final String title1;
  final String title2;
  final double? width;
  final VoidCallback? onTap;
  final double? height;
  final double? height1;
  final double? width1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        width: 300,
        decoration: BoxDecoration(
          color: isDarkMode
              ? const Color.fromARGB(255, 168, 106, 106).withOpacity(0.3)
              : const Color.fromARGB(255, 218, 163, 163).withOpacity(0.99),
          borderRadius: BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 20,
            ),
          ],
        ),

        child: Row(
          children: [
            Image.asset(Name),
            SizedBox(width: width),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title1,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  title2,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
