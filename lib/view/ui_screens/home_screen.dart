import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partner_foodbnb/controller/home_controller.dart';
import 'package:partner_foodbnb/view/nav_screens/earnings_screen.dart';
import 'package:partner_foodbnb/view/nav_screens/menu_screen.dart';
import 'package:partner_foodbnb/view/nav_screens/orders_screen.dart';
import 'package:partner_foodbnb/view/nav_screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> pages = [
    OrderScreen(),
    MenuScreen(),
    EarningsScreen(),
    ProfileScreen(),
  ];

  final HomeController hc = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Obx(() => pages[hc.selectedIndex.value]),

      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: hc.selectedIndex.value,
          onDestinationSelected: (index) {
            hc.selectedIndex.value = index;
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.red.shade400,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.receipt_long),
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(Icons.menu_book_sharp),
              label: 'Menu',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Earnings',
            ),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
