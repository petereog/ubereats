import 'package:flutter/material.dart';

class DineinScreen extends StatelessWidget {
  const DineinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),

            // Location header
            const Text(
              'Now . Ikeja GRA',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            // ---- Dine-in card 1 ----
            _buildDineInCard(
              imagePath: 'assets/images/1585ceb3-3e22-445b-b2c0-d11580a1b1b5 1 (1).png',
              name: 'Frish Foods',
              rating: '44',
            ),

            const SizedBox(height: 20),

            // ---- Dine-in card 2 ----
            _buildDineInCard(
              imagePath: 'assets/images/1585ceb3-3e22-445b-b2c0-d11580a1b1b5 1 (2).png',
              name: 'Roll N slice',
              rating: '44',
            ),

            const SizedBox(height: 20),

            // ---- Dine-in card 3 ----
            _buildDineInCard(
              imagePath: 'assets/images/1585ceb3-3e22-445b-b2c0-d11580a1b1b5 1 (3).png',
              name: 'Ethopian Sweets',
              rating: '44',
            ),

            const SizedBox(height: 20),

            // ---- Dine-in card 4 ----
            _buildDineInCard(
              imagePath: 'assets/images/1585ceb3-3e22-445b-b2c0-d11580a1b1b5 1 (4).png',
              name: 'Reez Restaurant',
              rating: '44',
            ),

            const SizedBox(height: 20),

            // ---- Dine-in card 5 ----
            _buildDineInCard(
              imagePath: 'assets/images/1585ceb3-3e22-445b-b2c0-d11580a1b1b5 1.png',
              name: 'Burgs Restaurant',
              rating: '44',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDineInCard({
    required String imagePath,
    required String name,
    required String rating,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image with heart icon overlay
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFE6E6E6),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Name and rating row
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  rating,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}