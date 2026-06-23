import 'package:flutter/material.dart';

class DineinScreen extends StatelessWidget {
  const DineinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant, size: 60, color: Colors.black),
            SizedBox(height: 16),
            Text(
              'Dine-in',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Find restaurantjhvlhvlhs near you to dine in',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}