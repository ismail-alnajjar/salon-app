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

  Future<bool> _onWillPop() async {
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
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        ////////////////////////////////////////////
        drawer: CustomDrawer(
          isDarkMode: isDarkMode,
          onThemeChanged: (val) {
            setState(() {
              isDarkMode = val;
            });
          },
        ),
        ///////////////////////////////////////////////////
        body: Stack(
          children: [
            // الخلفية المتدرجة
            Container(
              width: double.infinity,
              height: double.infinity,

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // زر القائمة أعلى اليسار
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

                      // بطاقة العروض الكبيرة

                      // صف مربعات الخدمات
                      Wrap(
                        children: [
                          Container(
                            height: 680,
                            width: 360,
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? const Color.fromARGB(
                                      255,
                                      144,
                                      79,
                                      79,
                                    ).withOpacity(0.3)
                                  : Color(0xffFBECE5),
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
                                  offset: Offset(0, 4),
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
                                children: [
                                  ////////////////////////////////////////////////
                                  CostumContainer(
                                    ////////////////////////////////////////////////////////////////////////////////
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OffersPage(),
                                        ),
                                      );
                                    },
                                    Name: 'assets/sshwar.png',
                                    title1: 'Special Offer',
                                    title2: 'Enjoy Exclusive deals',
                                  ),
                                  ////////////////////////////////////////////////////////////////
                                  ///
                                  SizedBox(height: 25),
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
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Hiar Care',
                                        icon: FontAwesomeIcons.scissors,
                                        isDarkMode: isDarkMode,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => HairPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Nail Care',
                                        icon: FontAwesomeIcons.handSparkles,
                                        isDarkMode: isDarkMode,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => NailPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Skin Care',
                                        icon: FontAwesomeIcons.solidFaceSmile,
                                        isDarkMode: isDarkMode,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SkinPage(),
                                            ),
                                          );
                                        },
                                      ),
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Makeup',
                                        icon: Icons.brush,
                                        isDarkMode: isDarkMode,
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MakeupPage(),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 18),
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
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  CostumContainer(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => OurOffersPage(),
                                        ),
                                      );
                                    },
                                    width: 10,
                                    Name: 'assets/mana.png',
                                    title1: '    Pedicure \n & Manicure ',
                                    title2: 'Offer for \$30',
                                  ),
                                  SizedBox(height: 25),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CostomIconB(
                                        uri:
                                            'https://www.facebook.com/ismail.alnajjar.2025',
                                        icon: FontAwesomeIcons.facebook,
                                      ),
                                      CostomIconB(
                                        uri: 'https://www.instagram.com/',
                                        icon: FontAwesomeIcons.instagram,
                                      ),
                                    ],
                                  ),

                                  /////////////////////////
                                ],
                              ),
                            ),
                          ),
                        ],
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
