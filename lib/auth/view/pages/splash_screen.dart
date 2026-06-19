import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubereats/auth/view/pages/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait 3 seconds then navigate to LandingScreen
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const LandingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142328),
      body: Center(
        child: Image.asset(
          'assets/images/Logo.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}