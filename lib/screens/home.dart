import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'DSC World',
              style: TextStyle(fontSize: 22),
            ),
            centerTitle: true),
        body: SafeArea(child: Center()),
        drawer: DrawerSection());
  }
}
