import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../navigation/view/home_tab_contoller.dart';
import 'home_screen.dart';
import '../../../Pickup/view/pages/pickup_screen.dart';
import '../../../dine_in/view/pages/dinein_screen.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeTabController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),

            SizedBox(
              width: 400,
              height: 50,
              child: TabBar(
                controller: controller.tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  color: const Color.fromARGB(255, 6, 6, 6),
                  borderRadius: BorderRadius.circular(40),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                tabs: const [
                  Tab(text: 'Delivery'),
                  Tab(text: 'Pick-up'),
                  Tab(text: 'Dine-in'),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                   
                        HomeScreen(),
                        PickupScreen(),
                        DineinScreen(),
                      ],
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
