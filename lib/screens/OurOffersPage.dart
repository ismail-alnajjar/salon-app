import 'package:flutter/material.dart';

class OurOffersPage extends StatelessWidget {
  const OurOffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Offers')),
      body: Center(child: Text('No offers available at the moment.')),
    );
  }
}
