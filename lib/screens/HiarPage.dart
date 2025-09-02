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
          ? const Color(0xff2B2B2B) // رمادي داكن ناعم
          : const Color(0xffFBEAEA), // بيج وردي فاتح
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3A3A3A) // أفتح شوي من الخلفية الداكنة
            : const Color(0xffF2CFCF), // درجة أغمق من الخلفية الفاتحة
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.15),
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
              color: isDarkMode ? Colors.pink[300] : Colors.pink[700],
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
              Name: 'assets/1-H.png',
              title1: 'Hair cut',
              title2: 'Long haircut & short haircut & sideburns cut',
            ),
            CostumCon2(
              title3: '40\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/2-H.png',
              title1: 'Hair styling',
              title2: 'Professional hair styling with modern looks',
            ),
            CostumCon2(
              title3: '25\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/3-H.png',
              title1: 'Trim',
              title2: 'Beard trimming & sideburns',
            ),
            CostumCon2(
              title3: '50\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-H.png',
              title1: 'Coloring',
              title2: 'Hair coloring & highlights',
            ),
            CostumCon2(
              title3: '60\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/5-H.png',
              title1: 'Keratin',
              title2: 'Keratin treatment for smooth shiny hair',
            ),
          ],
        ),
      ),
    );
  }
}
