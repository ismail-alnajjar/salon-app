import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  String? profileImageUrl;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    if (doc.exists) {
      nameController.text = doc['name'] ?? '';
      profileImageUrl = doc['profileImage'] ?? '';
      emailController.text = doc['email'] ?? user.email!;
    } else {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'name': 'User Name',
        'profileImage': '',
        'email': user.email!,
      });
      nameController.text = 'User Name';
      profileImageUrl = '';
      emailController.text = user.email!;
    }
    setState(() {});
  }

  Future<void> pickAndUploadImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile == null) return;

      setState(() => isLoading = true);

      File file = File(pickedFile.path);
      final ref = FirebaseStorage.instance.ref().child(
        'users/${user.uid}/profile.jpg',
      );

      await ref.putFile(file);
      final url = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update(
        {'profileImage': url},
      );

      setState(() {
        profileImageUrl = url;
        isLoading = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Profile image updated')));
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error uploading image: $e')));
    }
  }

  Future<void> updateName() async {
    if (nameController.text.trim().isEmpty) return;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
      'name': nameController.text.trim(),
    });
    setState(() {});
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Name updated')));
  }

  Future<void> updateEmail() async {
    if (emailController.text.trim().isEmpty) return;
    try {
      await user.updateEmail(emailController.text.trim());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Email updated')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error updating email: $e')));
    }
  }

  Future<void> updatePassword() async {
    if (oldPasswordController.text.isEmpty ||
        newPasswordController.text.isEmpty)
      return;
    final cred = EmailAuthProvider.credential(
      email: user.email!,
      password: oldPasswordController.text,
    );
    try {
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(newPasswordController.text);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Password updated')));
      oldPasswordController.clear();
      newPasswordController.clear();
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error updating password: $e')));
    }
  }

  void _openEditNameDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Name'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updateName();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _openEditEmailDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Email'),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updateEmail();
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _openChangePasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Old Password'),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              updatePassword();
              Navigator.pop(context);
            },
            child: const Text('Save'),
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
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: pickAndUploadImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          profileImageUrl != null && profileImageUrl!.isNotEmpty
                          ? NetworkImage(profileImageUrl!)
                          : const AssetImage('assets/profile.jpg')
                                as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    nameController.text,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    emailController.text,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Edit Name'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _openEditNameDialog,
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text('Edit Email'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _openEditEmailDialog,
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text('Change Password'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: _openChangePasswordDialog,
                  ),
                ],
              ),
            ),
    );
  }
}
