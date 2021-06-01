import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'screens/splash_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeControler>(
        init: DarkModeControler(),
        builder: (controler) {
          return GetMaterialApp(
            theme:
                controler.isActive ? controler.darkTheme : controler.lightTheme,
            debugShowCheckedModeBanner: false,
            home: Splash(),
          );
        });
  }
}
