import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> favouriteCountries = [];
bool isFav = false;
List<bool> fav = [];

class CountryContainer extends StatefulWidget {
  final String countryName;
  CountryContainer({required this.countryName});

  @override
  _CountryContainerState createState() => _CountryContainerState();
}

class _CountryContainerState extends State<CountryContainer> {
  Future<void> checkfavourite() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFav = prefs.getBool('isFavourite') ?? false;
    });
  }

  @override
  void initState() {
    checkfavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
      child: Card(
          color: Color(0xff043551),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
          child: buildList()),
    );
  }

  Widget buildList() {
    final bool isFav = favouriteCountries.contains(widget.countryName);
    return ListTile(
      onTap: () {
        print('hi');
      },
      title: Text(widget.countryName,
          style: TextStyle(fontSize: 20, color: Colors.white)),
      trailing: GestureDetector(
        child: Icon(
          isFav ? Icons.star : Icons.star_border,
          color: isFav ? Colors.yellow : Colors.grey,
          size: 35,
        ),
        onTap: () async {
          final prefs = await SharedPreferences.getInstance();
          if (isFav) {
            setState(() {
              favouriteCountries.remove(widget.countryName);
              prefs.setStringList('favouriteList', favouriteCountries);
              prefs.setBool('isFavourite', isFav);
            });
          } else {
            setState(() {
              favouriteCountries.add(widget.countryName);
              prefs.setStringList('favouriteList', favouriteCountries);
              prefs.setBool('isFavourite', isFav);
            });
          }
          // print(favouriteCountries);
        },
      ),
    );
  }
}
