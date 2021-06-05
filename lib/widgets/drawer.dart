import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// This is the drawr widgets that has the logo and Dark mode switch
class DrawerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 100,
                ),
                Text(
                  'DSC World',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'DARK MODE',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),

            //Dark mode switch controller with GETX
            trailing: GetBuilder<DarkModeControler>(builder: (controler) {
              return Switch(
                  activeColor: Colors.green,
                  value: controler.isActive,
                  onChanged: (val) async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('isDark', val);
                    controler.checkMode();
                  });
            }),
          )
        ],
      ),
    );
  }
}
