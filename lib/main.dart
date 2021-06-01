import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/splash_screen.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    box.writeIfNull('isDark', false);

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
