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
    required this.Size,
  });
  final String Name;
  final String title1;
  final String title2;
  final double? width;
  final VoidCallback? onTap;
  final double? height;
  final double? height1;
  final double? width1;
  final double Size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height1 ?? 120,
        width: width1 ?? 300,
        padding: const EdgeInsets.all(8),
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
            // الصورة ثابتة الحجم
            Image.asset(Name, height: 100, width: 100, fit: BoxFit.cover),
            SizedBox(width: width ?? 10),
            // النص قابل للالتفاف
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: TextStyle(
                      fontSize: Size,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
