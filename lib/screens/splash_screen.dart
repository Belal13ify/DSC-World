import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'home.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: HomeScreen(),
      duration: 4000,
      imageSize: 130,
      imageSrc: "assets/images/loading.gif",
      backgroundColor: Colors.white,
      text: 'Welcome to DSC World',
      textStyle: TextStyle(
          fontSize: 33, color: Colors.blue, fontWeight: FontWeight.bold),
    );
  }
}
