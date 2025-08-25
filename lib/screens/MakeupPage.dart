import 'package:flutter/material.dart';

class MakeupPage extends StatelessWidget {
  const MakeupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Makeup Services')),
      body: Center(child: Text('No makeup services available at the moment.')),
    );
  }
}
