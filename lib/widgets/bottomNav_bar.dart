import 'package:flutter/material.dart';
import 'package:dsc_world/Controllers/bottomNavigation_Controller.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25.0),
        topRight: Radius.circular(25.0),
      ),
      child: GetBuilder<BottomNavController>(
        builder: (controller) => BottomNavigationBar(
          selectedFontSize: 16,
          unselectedFontSize: 14,
          backgroundColor: Color(0xff043551),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 35,
              ),
              label: 'Favourite',
            ),
          ],
          currentIndex: controller.selectedIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            controller.onItemTapped(index);
          },
        ),
      ),
    );
  }
}
