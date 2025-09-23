import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salon_app/helper/Drawer.dart';
import 'package:salon_app/helper/static1.dart';
import 'package:salon_app/screens/HiarPage.dart';
import 'package:salon_app/screens/MakeupPage.dart';
import 'package:salon_app/screens/NailPage.dart';
import 'package:salon_app/screens/OffersPage.dart';
import 'package:salon_app/screens/OurOffersPage.dart';
import 'package:salon_app/screens/SkinPage.dart';
import 'package:salon_app/widget/CostumCard.dart';
import 'package:salon_app/widget/CostumContainer.dart';
import 'package:salon_app/widget/CostumIconB.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;

        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(
          isDarkMode: isDarkMode,
          onThemeChanged: (val) {
            setState(() {
              isDarkMode = val;
            });
          },
        ),
        body: Stack(
          children: [
            // الخلفية المتدرجة
            Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    isDarkMode
                        ? const Color.fromARGB(255, 111, 93, 79)
                        : const Color(0xffE7C6AD),
                    isDarkMode
                        ? const Color.fromARGB(255, 95, 94, 94)
                        : const Color.fromARGB(255, 190, 189, 189),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // زر القائمة
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: isDarkMode
                                  ? const Color.fromARGB(179, 255, 255, 255)
                                  : const Color.fromARGB(255, 4, 4, 4),
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                        ],
                      ),

                      // الكونتينر الأساسي
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? const Color.fromARGB(
                                  255,
                                  144,
                                  79,
                                  79,
                                ).withOpacity(0.3)
                              : const Color(0xffFBECE5),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode
                                  ? const Color.fromARGB(
                                      255,
                                      111,
                                      110,
                                      110,
                                    ).withOpacity(0.2)
                                  : const Color.fromARGB(
                                      255,
                                      68,
                                      67,
                                      67,
                                    ).withOpacity(0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 100,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 30,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CostumContainer(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const OffersPage(),
                                    ),
                                  );
                                },
                                Name: 'assets/sshwar.png',
                                title1: 'Special Offer',
                                title2: 'Enjoy Exclusive deals',
                                Size: 22,
                              ),
                              const SizedBox(height: 25),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Book an Appointment',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // الصف الأول من الخدمات
                              Row(
                                children: [
                                  Expanded(
                                    child: CostumCard(
                                      height: 75,
                                      title: 'Hair Care',
                                      icon: FontAwesomeIcons.scissors,
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HairPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CostumCard(
                                      height: 75,
                                      title: 'Nail Care',
                                      icon: FontAwesomeIcons.handSparkles,
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NailPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // الصف الثاني من الخدمات
                              Row(
                                children: [
                                  Expanded(
                                    child: CostumCard(
                                      height: 75,
                                      title: 'Skin Care',
                                      icon: FontAwesomeIcons.solidFaceSmile,
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SkinCarePage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: CostumCard(
                                      height: 75,
                                      title: 'Makeup',
                                      icon: Icons.brush,
                                      isDarkMode: isDarkMode,
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const MakeupPage(),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Our Services',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              CostumContainer(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const OurOffersPage(),
                                    ),
                                  );
                                },
                                Name: 'assets/mana.png',
                                title1: 'Pedicure & Manicure',
                                title2: 'Offer for \$30',
                                Size: 18,
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CostomIconB(
                                    uri:
                                        'https://www.facebook.com/ismail.alnajjar.2025',
                                    icon: FontAwesomeIcons.facebook,
                                  ),
                                  SizedBox(width: 20),
                                  CostomIconB(
                                    uri: 'https://www.instagram.com/',
                                    icon: FontAwesomeIcons.instagram,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
