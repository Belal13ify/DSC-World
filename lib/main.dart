import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'screens/splash_screen.dart';

/* 
  please read carefully before using the app
  1- I used GETX state managment to manage my app state only when needed to increase the app perfomance instead of using statful widgets many times,

  2- I didnt use Statefull widget at all 

  3- I used shared preferences to store the state dark mode and favourite list in the local storage so I can have them back if I restarted or closed the app 
  4- I have added many features like deleting the country from the favourite list if you pressed the delete button,
  5- add a feature to either mark the country as favourite or not in the country information screen
  6- search feature will search for the country based on the query entered, for example if a country has the search query in position of its letters, it will show the country, it doesnt have to be in the first letters
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
