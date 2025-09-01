import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/BokingsPage.dart';
import 'package:salon_app/widget/CostomCon2.dart';

class HairPage extends StatelessWidget {
  const HairPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xff2C2C2C)
          : const Color(0xffF6D8D8),
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3E3E3E)
            : const Color(0xffE9C1C1),
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Hair Services',
          style: TextStyle(
            color: isDarkMode ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BookingPage()),
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: isDarkMode ? Colors.amber[300] : Colors.brown[800],
              size: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CostumCon2(
              title3: '30\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/pngegg.png',
              title1: 'Hair cut',
              title2: 'Long haircut & short haircut & sideburns cut',
            ),
            CostumCon2(
              title3: '40\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/pngegg.png',
              title1: 'Hair styling',
              title2: 'Professional hair styling with modern looks',
            ),
            CostumCon2(
              title3: '25\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/pngegg.png',
              title1: 'Trim',
              title2: 'Beard trimming & sideburns',
            ),
            CostumCon2(
              title3: '50\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/pngegg.png',
              title1: 'Coloring',
              title2: 'Hair coloring & highlights',
            ),
            CostumCon2(
              title3: '60\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/pngegg.png',
              title1: 'Keratin',
              title2: 'Keratin treatment for smooth shiny hair',
            ),
          ],
        ),
      ),
    );
  }
}
