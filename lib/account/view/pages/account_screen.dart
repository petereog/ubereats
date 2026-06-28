import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  Widget _buildMenuItem(String imagePath, String label, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Image.asset(imagePath, width: 24, height: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.green),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Profile header
              Row(
                children: [
                  Image.asset('assets/images/Ellipse 3.png', width: 56, height: 56),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Doe',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'View account',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              _buildMenuItem('assets/images/Group.png', 'Orders'),
              _buildMenuItem('assets/images/Favourites Icon.png', 'Your Favourites'),
              _buildMenuItem('assets/images/Restaurant-Rewards.png', 'Restaurant Rewards'),
              _buildMenuItem('assets/images/Wallet.png', 'Wallet'),
              _buildMenuItem('assets/images/Gift Icon.png', 'Gift Cards & Promotions'),
              _buildMenuItem('assets/images/Business.png', 'Business Preferences',
                  subtitle: 'Make work meals quicker and easier'),
              _buildMenuItem('assets/images/Vector (2).png', 'Help'),
              _buildMenuItem('assets/images/Vector (3).png', 'About'),
              _buildMenuItem('assets/images/Uber-Pass.png', 'Uber Pass',
                subtitle: 'Join free for 1 month'),
              _buildMenuItem('assets/images/Deliver.png', 'Deliver with Uber'),
              _buildMenuItem('assets/images/Settings Icon.png', 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}