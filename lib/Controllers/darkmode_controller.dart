import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

//Controlls the current Dark mode either light or dark

class DarkModeControler extends GetxController {
  bool isActive = false;

  //Dark theme if activates when dark mode is on

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
//ligh theme if activates when dark mode is off
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
    checkMode();
    super.onInit();
  }

  void checkMode() async {
    final prefs = await SharedPreferences.getInstance();
    isActive = prefs.getBool('isDark') ?? false;

    update();
  }
}
