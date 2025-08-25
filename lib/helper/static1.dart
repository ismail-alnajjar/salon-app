import 'package:flutter/material.dart';

bool isDarkMode = false;
final gradientColors = isDarkMode
    ? [Color(0xFF1A1A2E), Color(0xFF2E2E3A)]
    : [
        Color.fromARGB(255, 211, 199, 212),
        Color.fromARGB(255, 131, 117, 146),
        Color.fromARGB(255, 94, 78, 96),
      ];
