import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'package:get_storage/get_storage.dart';

class DrawerSection extends StatelessWidget {
  final box = GetStorage();

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
            trailing: GetBuilder<DarkModeControler>(builder: (controler) {
              return Switch(
                  activeColor: Colors.green,
                  value: controler.isActive,
                  onChanged: (val) {
                    controler.changeMode();
                    box.write('isDark', val);
                  });
            }),
          )
        ],
      ),
    );
  }
}
