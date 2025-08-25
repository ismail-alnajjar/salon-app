import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:url_launcher/url_launcher.dart';

class CostomIconB extends StatelessWidget {
  const CostomIconB({super.key, required this.uri, required this.icon});
  final String uri;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    void launchURL(String uri) async {
      final Uri url = Uri.parse(uri);
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    }

    return IconButton(
      icon: Icon(
        icon,
        color: isDarkMode
            ? Colors.white70
            : const Color.fromARGB(255, 52, 51, 51),
        size: 30,
      ),
      onPressed: () {
        launchURL(uri);
      },
    );
  }
}
