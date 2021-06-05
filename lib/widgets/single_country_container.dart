import 'package:dsc_world/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/favourites_controller.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';

// This is a class widget to show only the single country container Widget to instead of repeating ourselves with creating it many times

class CountryContainer extends StatelessWidget {
  final String countryName;
  CountryContainer({required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 20),
      child: GetBuilder<Data>(
        builder: (controller) => Card(
            color: Color(0xff043551),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.0)),
            child: GetBuilder<FavouritesControler>(
              init: FavouritesControler(),
              autoRemove: false,
              builder: (value) => Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 4),
                child: ListTile(
                  onTap: () async {
                    await controller.getCountryInfo(countryName);
                    Get.to(() => CountryInfo());
                  },
                  title: Text(countryName,
                      style: TextStyle(fontSize: 19, color: Colors.white)),

                  //Toggle Star Icon(Favourite icon) either on or off
                  trailing: GestureDetector(
                    child: Icon(
                      value.checkIconFavourite(countryName)
                          ? Icons.star
                          : Icons.star_border,
                      color: value.checkIconFavourite(countryName)
                          ? Colors.yellow
                          : Colors.grey,
                      size: 35,
                    ),
                    onTap: () async {
                      await value.checkfavourite(countryName);
                    },
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
