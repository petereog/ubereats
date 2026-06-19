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
      if (mounted) {
        Get.off(() => const LandingScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF142328),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 200,
                ),
                child: Image.asset(
                  'assets/images/eats.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFF06C167),
                        borderRadius: BorderRadius.circular(75),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}