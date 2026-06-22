import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubereats/home/view/pages/main_home_screen.dart';
import 'package:ubereats/browse/view/pages/browse_screen.dart';
import 'package:ubereats/grocery/view/pages/grocery_screen.dart';
import 'package:ubereats/basket/view/pages/basket_screen.dart';
import 'package:ubereats/account/view/pages/account_screen.dart';
import '../view_model/navigation_viewmodel.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  static final List<Widget> _pages = const [
    MainHomeScreen(),
    BrowseScreen(),
    GroceryScreen(),
    BasketScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(NavigationViewModel());

    return Obx(() => Scaffold(
      body: IndexedStack(
        index: viewModel.selectedIndex.value,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: viewModel.selectedIndex.value,
        onTap: viewModel.changeTab,
        selectedItemColor: const Color(0xFF06C167),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store), label: 'Grocery'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Basket'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
    ));
  }
}