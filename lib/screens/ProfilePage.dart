import 'package:flutter/material.dart';
import 'package:salon_app/screens/login.dart';

class ProfilePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProfilePage({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  // دالة لفتح Dialog منبثق
  void _openDialog(BuildContext context, String title, Widget content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: content,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // صورة الملف الشخصي
            Container(
              margin: const EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: const AssetImage('assets/profile.jpg'),
              ),
            ),
            // اسم المستخدم
            Text(
              userName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            // البريد الإلكتروني
            Text(
              userEmail,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // قائمة الخيارات
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _openDialog(
                  context,
                  'Edit Profile',
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: userName,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: userEmail,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Profile updated')),
                          );
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _openDialog(
                  context,
                  'Change Password',
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Old Password',
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'New Password',
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Password changed')),
                          );
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Booking History'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                _openDialog(
                  context,
                  'Booking History',
                  const Text('Here you can see your booking history.'),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // إعادة التوجيه إلى صفحة تسجيل الدخول بطريقة آمنة
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false, // حذف كل الصفحات السابقة
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
