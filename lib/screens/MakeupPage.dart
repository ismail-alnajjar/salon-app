import 'package:flutter/material.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/BokingsPage.dart';
import 'package:salon_app/widget/CostomCon2.dart';

class MakeupPage extends StatelessWidget {
  const MakeupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode
          ? const Color(0xff2B2B2B) // نفس خلفية Hair/Nail/SkinCare الداكنة
          : const Color(0xffFBEAEA), // نفس الخلفية الفاتحة
      appBar: AppBar(
        backgroundColor: isDarkMode
            ? const Color(0xff3A3A3A) // نفس AppBar الداكن
            : const Color(0xffF2CFCF), // نفس AppBar الفاتح
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.15),
        surfaceTintColor: Colors.transparent,
        title: Text(
          'Makeup Services',
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
              Name: 'assets/1-M.png',
              title1: 'Everyday Makeup',
              title2: 'Natural and light makeup for daily wear',
            ),
            CostumCon2(
              title3: '50\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/2-M.png',
              title1: 'Party Makeup',
              title2: 'Glamorous makeup for special events & parties',
            ),
            CostumCon2(
              title3: '70\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/3-M.png',
              title1: 'Bridal Makeup',
              title2: 'Professional bridal makeup for weddings',
            ),
            CostumCon2(
              title3: '40\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/4-M.png',
              title1: 'Photoshoot Makeup',
              title2: 'Flawless makeup for photo & video sessions',
            ),
            CostumCon2(
              title3: '60\$',
              width1: double.infinity,
              height1: 150,
              Name: 'assets/5-M.png',
              title1: 'Evening Makeup',
              title2: 'Elegant makeup for dinners & night events',
            ),
          ],
        ),
      ),
    );
  }
}
