import 'package:flutter/material.dart';

class ConvienceScreen extends StatefulWidget {
  const ConvienceScreen({super.key});

  @override
  State<ConvienceScreen> createState() => _ConvienceScreenState();
}

class _ConvienceScreenState extends State<ConvienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Convenience',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Featured stores',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // ---- Horizontal store cards ----
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png', 'Gopuff'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1 (1).png', '7Eleven'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/w.png', 'Walgreens'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png', 'Gopuff'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png', 'Gopuff'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png', 'Gopuff'),
                      const SizedBox(width: 15),
                      _storeCard('assets/images/Gopuff-3c0ba4f0-8604-11ec-89c7-dde18fcfe420 1.png', 'Gopuff'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ---- Store list rows ----
                _storeRow('assets/images/Rectangle 198 (7).png', 'Begs & Megs',      'Opens at 08:00 AM', 'Spend US\$20, save US\$5'),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (1).png', 'Orange Inn',       'Opens at 08:00 AM', null),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (2).png', 'Bricks Guards',    'Opens at 08:00 AM', null),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (3).png', '7Eleven',          'Opens at 08:00 AM', 'Spend US\$20, save US\$5'),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (4).png', 'Cardenas Markets', 'Opens at 08:00 AM', null),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (5).png', 'Pick \'n\' Save',  'Opens at 08:00 AM', null),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198 (8).png',     'Vintage Berkeley', 'Opens at 08:00 AM', 'Spend US\$20, save US\$5'),
                const SizedBox(height: 12),
                _storeRow('assets/images/Rectangle 198.png',     'Quick Stop 52',    'Opens at 08:00 AM', 'Spend US\$20, save US\$5'),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---- Reusable store card widget ----
  Widget _storeCard(String imagePath, String name) {
    return Container(
      height: 200,
      width: 164,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFEFF3FE),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text('Opens at 10:00AM'),
        ],
      ),
    );
  }

  // ---- Reusable store list row ----
  Widget _storeRow(String imagePath, String name, String openTime, String? promo) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(openTime),
            if (promo != null)
              Text(
                promo,
                style: const TextStyle(color: Colors.green),
              ),
          ],
        ),
      ],
    );
  }
}