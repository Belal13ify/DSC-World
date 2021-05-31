import 'package:dsc_world/Controler/controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screens/splash_screen.dart';

void main() async {
  await GetStorage.init();
  Get.put(DarkModeControler());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    box.writeIfNull('isDark', false);

    return GetX<DarkModeControler>(builder: (controler) {
      return GetMaterialApp(
        theme: controler.isActive.value ? ThemeData.dark() : ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      );
    });
  }
}
