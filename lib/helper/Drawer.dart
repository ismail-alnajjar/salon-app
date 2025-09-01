import 'package:flutter/material.dart';
import 'package:salon_app/screens/Bookings.dart';
import 'package:salon_app/widget/CostumListile.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const CustomDrawer({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: isDarkMode ? Color(0xff6E5856) : Color(0xffF1E3DC),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            CostomListile(
              title: 'Profile',
              iconData: Icons.person,
              onTap: () {},
            ),
            CostomListile(
              title: 'Settings',
              iconData: Icons.settings,
              onTap: () {},
            ),
            /////////////////////////////////////
            CostomListile(
              title: 'Bookings',
              iconData: Icons.book_online,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingsPage()),
                );
              },
            ),
            ////////////////////////////////////
            const Divider(),
            SwitchListTile(
              activeColor: Colors.black,
              title: Text(
                'Dark Mode',
                style: TextStyle(
                  color: isDarkMode
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              value: isDarkMode,
              onChanged: onThemeChanged,
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
