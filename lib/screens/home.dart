import '../widgets/bottomNav_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'continents.dart';
import 'favourite.dart';
import 'package:dsc_world/Controllers/bottomNavigation_Controller.dart';
import 'package:get/get.dart';

// This is the home screen that shows the current screen either continents screen or favourite screen based on the index of bottom navigation bar, Default is Zero which is the continents screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> selectedScreen = [Continents(), Favourite()];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'DSC World',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          centerTitle: true),
      body: SafeArea(
          child: GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (controller) => Center(
          child: selectedScreen[controller.selectedIndex],
        ),
      )),
      drawer: DrawerSection(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
