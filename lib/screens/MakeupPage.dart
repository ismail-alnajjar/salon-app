import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/widget/Servecis.dart';

class MakeupPage extends StatelessWidget {
  const MakeupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color.fromARGB(255, 118, 89, 83)
          : const Color.fromARGB(255, 209, 165, 165),
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color.fromARGB(255, 118, 89, 83)
            : const Color.fromARGB(255, 209, 165, 165),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Hair Services',
          style: TextStyle(color: isDarkMode ? Colors.white : Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Servecis(
              title: "Hair Care",
              image: "https://example.com/hair.jpg",
              description:
                  "Professional hair treatments to keep your hair healthy & shiny.",
              services: [
                {"name": "Hair Cut", "price": "20", "time": "30 min"},
                {"name": "Hair Coloring", "price": "50", "time": "1 hr"},
                {"name": "Hair Spa", "price": "35", "time": "45 min"},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
