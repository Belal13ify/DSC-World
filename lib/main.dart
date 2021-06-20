import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'screens/splash_screen.dart';

/* 
  please read carefully before using the app
  1- This Project is based on Flutter SDK 2.2
  2- I used GETX state managment to manage my app state only when needed to increase the app perfomance instead of using statful widgets many times,

  3- I didnt use Statefull widget at all 

  4- I used shared preferences to store the state dark mode and favourite list in the local storage so I can have them back if I restarted or closed the app 
  5- I have added many features like deleting the country from the favourite list if you pressed the delete button, and also, delete all country on pressing FAB, and there is a confirmation before deleting too.
  6- add a feature to either mark the country as favourite or not in the country information screen
  7- search feature will search for the country based on the entered query, for example if a country has the search query in the first position of its characters, it will show the country.
  8- app runs in portaid mode only
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DarkModeControler>(
        //Controlling the dark mode and initiallizng it false value at the first install of the app
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
