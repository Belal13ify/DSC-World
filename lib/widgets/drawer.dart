import 'package:flutter/material.dart';

class DrawerSection extends StatefulWidget {
  @override
  _DrawerSectionState createState() => _DrawerSectionState();
}

bool pressed = false;

class _DrawerSectionState extends State<DrawerSection> {
  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              setState(() {
                pressed = !pressed;
              });
            },
            title: Text(
              'DARK MODE',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey),
            ),
            trailing: Icon(
              pressed ? Icons.toggle_on : Icons.toggle_off,
              size: 60,
              color: pressed ? Colors.green : Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
