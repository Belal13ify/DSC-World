import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List favourite = [];

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  Future<void> getFavouriteCountries() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      favourite = prefs.getStringList('favouriteList') ?? [];
    });
  }

  @override
  void initState() {
    getFavouriteCountries();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Favourites',
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff043551),
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 35,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: favourite.length,
                  itemBuilder: (BuildContext context, int index) {
                    var name = favourite[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, right: 25.0, top: 10),
                      child: Card(
                        color: Color(0xff043551),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0)),
                        child: ListTile(
                          onTap: () {
                            print('hi');
                          },
                          title: Text(
                            name,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
