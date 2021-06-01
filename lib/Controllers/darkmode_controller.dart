import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class DarkModeControler extends GetxController {
  bool isActive = false;
  final box = GetStorage();
  get darkTheme => ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme:
            AppBarTheme(brightness: Brightness.dark, color: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.dark,
        canvasColor: Colors.grey[900],
        accentColor: Colors.pink,
        accentIconTheme: IconThemeData(color: Colors.white),
      );

  get lightTheme => ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Colors.grey,
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          labelStyle: TextStyle(color: Colors.white),
        ),
        canvasColor: Colors.white,
        brightness: Brightness.light,
        accentColor: Colors.grey,
        accentIconTheme: IconThemeData(color: Colors.black),
      );

  @override
  void onInit() {
    super.onInit();
    isActive = box.read('isDark') ?? false;
  }

  void changeMode() {
    isActive = !isActive;
    // box.write('isDark', isActive.value);
    update();
  }
}
