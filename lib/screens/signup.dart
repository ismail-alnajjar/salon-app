import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/user_model.dart';
import 'package:salon_app/providers/users_providers.dart';

import '../widget/CostumTextForm.dart';
import 'login.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool isLoading = false;
  String? emailError;
  String? passwordError;
  String? confirmError;

  bool _obscurePassword = true; // 👈 لإخفاء/إظهار كلمة السر
  bool _obscureConfirm = true; // 👈 لإخفاء/إظهار تأكيد كلمة السر

  void signUp() async {
    setState(() {
      emailError = null;
      passwordError = null;
      confirmError = null;
    });

    if (passwordController.text != confirmController.text) {
      setState(() {
        confirmError = "Passwords do not match";
      });
      return;
    }

    setState(() => isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      ref.read(userProvider.notifier).state = UserModel(
        uid: nameController.text.trim(),
        email: emailController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'email-already-in-use' || e.code == 'invalid-email') {
          emailError = e.message;
        } else if (e.code == 'weak-password') {
          passwordError = e.message;
        } else {
          emailError = e.message;
        }
      });
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
          );
        }
        return false;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffD39E9E),
                Color.fromARGB(255, 200, 171, 149),
                Color.fromARGB(255, 171, 130, 130),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/salon.png', height: 200),
                  const SizedBox(height: 40),
                  const Text(
                    "Create your account",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 40),
                  CustomTextForm(
                    name: "Name",
                    controller: nameController,
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  CustomTextForm(
                    name: "Email",
                    controller: emailController,
                    onTap: () {},
                    errorText: emailError,
                  ),
                  const SizedBox(height: 20),

                  // 🔑 كلمة السر
                  CustomTextForm(
                    name: "Password",
                    controller: passwordController,
                    onTap: () {},
                    obscureText: _obscurePassword,
                    errorText: passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔑 تأكيد كلمة السر
                  CustomTextForm(
                    name: "Confirm Password",
                    controller: confirmController,
                    onTap: () {},
                    obscureText: _obscureConfirm,
                    errorText: confirmError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirm = !_obscureConfirm;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : signUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: Color(0xFF6A11CB),
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color.fromARGB(255, 168, 100, 175),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "Already have an account? Login",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
