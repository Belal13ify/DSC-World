import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/favourites_controller.dart';

List<String> favouriteCountries = [];

class CountryContainer extends StatelessWidget {
  final String countryName;
  CountryContainer({required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20),
      child: Card(
          color: Color(0xff043551),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
          child: GetBuilder<FavouritesControler>(
            init: FavouritesControler(),
            builder: (value) => ListTile(
              onTap: () {
                print('hi');
              },
              title: Text(countryName,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              trailing: GestureDetector(
                child: Icon(
                  value.getFavourite(countryName)
                      ? Icons.star
                      : Icons.star_border,
                  color: value.getFavourite(countryName)
                      ? Colors.yellow
                      : Colors.grey,
                  size: 35,
                ),
                onTap: () async {
                  value.checkfavourite(countryName);
                },
              ),
            ),
          )),
    );
  }
}
