import 'package:flutter/material.dart';

class SkinPage extends StatelessWidget {
  const SkinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skin Services')),
      body: Center(child: Text('No skin services available at the moment.')),
    );
  }
}
