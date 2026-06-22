import 'package:flutter/material.dart';

class DineinScreen extends StatefulWidget {
  const DineinScreen({super.key});

  @override
  State<DineinScreen> createState() => _DineinScreenState();
}

class _DineinScreenState extends State<DineinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Welcome  to Dine screen')
        ],
      )
    );
  }
}