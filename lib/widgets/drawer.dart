import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controler/controler.dart';
import 'package:get_storage/get_storage.dart';

class DrawerSection extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    DarkModeControler sx = Get.find();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/loading.gif'),
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
            trailing: GetX<DarkModeControler>(builder: (controler) {
              return Switch(
                  activeColor: Colors.green,
                  value: sx.isActive.value,
                  onChanged: (val) {
                    sx.changeMode();
                    box.write('isDark', val);
                  });
            }),
          )
        ],
      ),
    );
  }
}
