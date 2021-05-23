// import 'package:dsc_world/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'continents.dart';
import 'favourite.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> selectedScreen = [Continents(), Favourite()];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'DSC World',
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true),
      body: SafeArea(
          child: Center(
        child: selectedScreen[_selectedIndex],
      )),
      drawer: DrawerSection(),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          selectedFontSize: 16,
          unselectedFontSize: 14,
          backgroundColor: Color(0xff043551),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 35,
              ),
              label: 'Favourite',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
