import 'package:flutter/material.dart';

class HairPage extends StatelessWidget {
  const HairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hair Services')),
      body: Center(child: Text('No hair services available at the moment.')),
    );
  }
}
