import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';

class CostomListile extends StatelessWidget {
  const CostomListile({
    super.key,
    required this.title,
    required this.iconData,
    this.onTap,
  });
  final String title;
  final IconData iconData;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: isDarkMode
            ? Color.fromARGB(255, 255, 255, 255)
            : Color.fromARGB(255, 0, 0, 0),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDarkMode
              ? Color.fromARGB(255, 255, 255, 255)
              : Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      onTap: onTap,
    );
  }
}
