import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/BokingsPage.dart';
import 'package:salon_app/widget/CostomCon2.dart';

class NailPage extends StatelessWidget {
  const NailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xff2B2B2B) // نفس خلفية HairPage الداكنة
          : const Color(0xffFBEAEA), // نفس خلفية HairPage الفاتحة
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3A3A3A) // نفس درجة AppBar الداكنة
            : const Color(0xffF2CFCF), // نفس درجة AppBar الفاتحة
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Nail Services',
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
              title3: '20\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/1-N.png',
              title1: 'Manicure',
              title2: 'Nail cleaning, shaping & cuticle care',
            ),
            CostumCon2(
              title3: '25\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/2-N.png',
              title1: 'Pedicure',
              title2: 'Foot soak, nail shaping & cuticle care',
            ),
            CostumCon2(
              title3: '30\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/3-N.png',
              title1: 'Nail Art',
              title2: 'Creative nail designs with polish & stickers',
            ),
            CostumCon2(
              title3: '35\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-N.png',
              title1: 'Gel Nails',
              title2: 'Durable glossy gel polish application',
            ),
            CostumCon2(
              title3: '40\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/5-N.png',
              title1: 'Acrylic Nails',
              title2: 'Acrylic nail extensions with custom shapes',
            ),
          ],
        ),
      ),
    );
  }
}
