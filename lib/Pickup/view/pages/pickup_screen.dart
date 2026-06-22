import 'package:flutter/material.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.black),
            SizedBox(height: 16),
            Text(
              'Pick-up',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Order ahead and pick up at the restaurant',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}