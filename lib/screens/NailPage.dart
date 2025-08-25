import 'package:flutter/material.dart';

class NailPage extends StatelessWidget {
  const NailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nail Services')),
      body: Center(child: Text('No nail services available at the moment.')),
    );
  }
}
