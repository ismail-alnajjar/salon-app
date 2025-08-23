import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salon_app/widget/CostumCard.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDarkMode = false;
  DateTime? lastPressed;

  void _launchURL(String uri) async {
    final Uri url = Uri.parse(uri);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

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
    final gradientColors = isDarkMode
        ? [Color(0xFF1A1A2E), Color(0xFF2E2E3A)]
        : [
            Color.fromARGB(255, 168, 100, 175),
            Color(0xFF6A11CB),
            Color.fromARGB(255, 168, 100, 175),
          ];

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
            child: Column(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black87),
                  title: Text('Profile'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black87),
                  title: Text('Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.black87),
                  title: Text('History'),
                  onTap: () {},
                ),
                const Divider(),
                SwitchListTile(
                  title: Text('Dark Mode'),
                  value: isDarkMode,
                  onChanged: (val) {
                    setState(() {
                      isDarkMode = val;
                    });
                  },
                  secondary: Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            // الخلفية المتدرجة
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
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
                              color: isDarkMode ? Colors.white70 : Colors.white,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                          ),
                        ],
                      ),

                      // بطاقة العروض الكبيرة
                      const SizedBox(height: 20),

                      // صف مربعات الخدمات
                      Wrap(
                        children: [
                          Container(
                            height: 700,
                            width: 360,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 168, 100, 175),

                                  Color.fromARGB(255, 168, 100, 175),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              color: const Color.fromARGB(255, 227, 191, 224),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 4),
                                  blurRadius: 8,
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
                                  CostumCard(
                                    height: 150,
                                    width: 300,
                                    title: 'Special Offer',
                                    icon: FontAwesomeIcons.solidAddressCard,
                                    isDarkMode: isDarkMode,
                                    onTap: () {},
                                  ),
                                  ////////////////////////////////////////////////////////////////
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Special Offer',
                                        icon: FontAwesomeIcons.solidAddressCard,
                                        isDarkMode: isDarkMode,
                                        onTap: () {},
                                      ),
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Special Offer',
                                        icon: FontAwesomeIcons.solidAddressCard,
                                        isDarkMode: isDarkMode,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Special Offer',
                                        icon: FontAwesomeIcons.solidAddressCard,
                                        isDarkMode: isDarkMode,
                                        onTap: () {},
                                      ),
                                      CostumCard(
                                        height: 75,
                                        width: 150,
                                        title: 'Special Offer',
                                        icon: FontAwesomeIcons.solidAddressCard,
                                        isDarkMode: isDarkMode,
                                        onTap: () {},
                                      ),
                                    ],
                                  ),
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
                                  CostumCard(
                                    height: 150,
                                    width: 300,
                                    title: 'Special Offer',
                                    icon: FontAwesomeIcons.solidAddressCard,
                                    isDarkMode: isDarkMode,
                                    onTap: () {},
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.facebook,
                                          color: const Color.fromARGB(
                                            255,
                                            208,
                                            211,
                                            214,
                                          ),
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _launchURL(
                                            'https://www.facebook.com/ismail.alnajjar.2025',
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.instagram,
                                          color: const Color.fromARGB(
                                            255,
                                            208,
                                            211,
                                            214,
                                          ),
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _launchURL(
                                            'https://www.instagram.com/',
                                          );
                                        },
                                      ),
                                    ],
                                  ),
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
