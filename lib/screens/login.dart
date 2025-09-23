import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:salon_app/model/user_model.dart';
import 'package:salon_app/providers/users_providers.dart';
import 'package:salon_app/screens/homepage.dart';
import 'package:salon_app/screens/signup.dart';

import '../widget/CostumTextForm.dart';

// Providers
final isLoadingProvider = StateProvider<bool>((ref) => false);
final emailErrorProvider = StateProvider<String?>((ref) => null);
final passwordErrorProvider = StateProvider<String?>((ref) => null);

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DateTime? lastPressed;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    // إعادة تعيين الأخطاء
    ref.read(emailErrorProvider.notifier).state = null;
    ref.read(passwordErrorProvider.notifier).state = null;

    if (!_formKey.currentState!.validate()) return;

    ref.read(isLoadingProvider.notifier).state = true;

    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        ref.read(userProvider.notifier).state = UserModel.fromFirebaseUser(
          firebaseUser,
        );

        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'invalid-email') {
        ref.read(emailErrorProvider.notifier).state = "Invalid email";
        ref.read(passwordErrorProvider.notifier).state =
            "Invalid email or password";
      } else if (e.code == 'wrong-password') {
        ref.read(passwordErrorProvider.notifier).state = "Wrong password";
      } else {
        ref.read(passwordErrorProvider.notifier).state =
            e.message ?? "Login failed";
      }
    } catch (_) {
      ref.read(passwordErrorProvider.notifier).state = "Something went wrong";
    } finally {
      ref.read(isLoadingProvider.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLoading = ref.watch(isLoadingProvider);
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        if (lastPressed == null ||
            now.difference(lastPressed!) > const Duration(seconds: 2)) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('اضغط مرة أخرى للخروج'),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
        return true;
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/salon.png', height: 200),
                    const SizedBox(height: 40),
                    const Text(
                      "Login to your account",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 40),
                    CustomTextForm(
                      name: "Email",
                      controller: emailController,
                      errorText: emailError,
                    ),
                    const SizedBox(height: 20),
                    CustomTextForm(
                      name: "Password",
                      controller: passwordController,
                      obscureText: true,
                      errorText: passwordError,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Color(0xFF6A11CB),
                                strokeWidth: 3,
                              )
                            : const Text(
                                "Login",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 168, 100, 175),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.white70),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => const SignUp()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
