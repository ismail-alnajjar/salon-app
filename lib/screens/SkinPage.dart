import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/BokingsPage.dart';
import 'package:salon_app/widget/CostomCon2.dart';

class SkinCarePage extends StatelessWidget {
  const SkinCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xff2B2B2B) // نفس خلفية Hair/Nail الداكنة
          : const Color(0xffFBEAEA), // نفس الخلفية الفاتحة
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3A3A3A) // نفس AppBar الداكن
            : const Color(0xffF2CFCF), // نفس AppBar الفاتح
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Skin Care Services',
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
              title3: '50\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/1-S.png',
              title1: 'Facial',
              title2: 'Deep cleansing, exfoliation & hydration',
            ),
            CostumCon2(
              title3: '40\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/2-S.png',
              title1: 'Mask Treatment',
              title2: 'Customized masks for glowing skin',
            ),
            CostumCon2(
              title3: '35\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/3-S.png',
              title1: 'Microdermabrasion',
              title2: 'Gentle exfoliation to remove dead skin cells',
            ),
            CostumCon2(
              title3: '45\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-S.png',
              title1: 'Acne Treatment',
              title2: 'Professional care for acne-prone skin',
            ),
            CostumCon2(
              title3: '60\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/5-S.png',
              title1: 'Anti-Aging Treatment',
              title2: 'Wrinkle reduction & skin rejuvenation',
            ),
          ],
        ),
      ),
    );
  }
}
