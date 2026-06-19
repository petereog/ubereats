import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubereats/auth/view/pages/splash_screen.dart';
import 'package:ubereats/auth/view/pages/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'UberMoveText',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LandingScreen(),
    );
  }
}