import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/BokingsPage.dart';
import 'package:salon_app/widget/CostomCon2.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xff2B2B2B)
          : const Color(0xffFBEAEA),
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3A3A3A)
            : const Color(0xffF2CFCF),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Special Offers 💅💇‍♀️',
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
            // عرض 1
            CostumCon2(
              title3: '45\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-M.png',
              title1: 'Haircut + Manicure',
              title2:
                  'Get a stylish haircut and a relaxing manicure at a great price!',
            ),

            // عرض 2
            CostumCon2(
              title3: '60\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-M.png',
              title1: 'Makeup + Hairstyle',
              title2:
                  'Perfect combo for any occasion – flawless makeup & elegant hair.',
            ),

            // عرض 3
            CostumCon2(
              title3: '80\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-M.png',
              title1: 'Full Spa + Pedicure',
              title2:
                  'Pamper yourself with a luxurious spa and pedicure session.',
            ),

            // عرض 4
            CostumCon2(
              title3: '100\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/3-M.png',
              title1: 'Bridal Pack',
              title2:
                  'Complete bridal look – makeup, hair, and nails for your big day!',
            ),

            // عرض 5
            CostumCon2(
              title3: '55\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-M.png',
              title1: 'Facial + Hair Treatment',
              title2:
                  'Nourish your skin and hair with our relaxing care package.',
            ),
          ],
        ),
      ),
    );
  }
}
