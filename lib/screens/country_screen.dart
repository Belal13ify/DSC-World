import 'package:dsc_world/Controllers/favourites_controller.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// this is the single country screen information to show information about the country pressed
class CountryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Data>(
      builder: (value) => Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xffF44236),
              title: Text(value.countryName,
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              centerTitle: true,
              actions: [
                GetBuilder<FavouritesControler>(
                  builder: (controller) => IconButton(
                    onPressed: () async {
                      await controller.checkfavourite(
                          value.countryName, value.emoji);
                    },
                    icon: Icon(
                        controller.checkIconFavourite(value.countryName)
                            ? Icons.star
                            : Icons.star_border,
                        color: controller.checkIconFavourite(value.countryName)
                            ? Colors.yellow
                            : Colors.black54),
                    color: Colors.black,
                    iconSize: 45,
                  ),
                )
              ]),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView(
                children: [
                  // this is where it shows the country flag or the emoji
                  Center(
                    child: Container(
                      child: Text(
                        value.emoji,
                        // textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 140),
                      ),
                    ),
                  ),

                  ListTile(
                    leading: Icon(Icons.anchor),
                    title: Text(
                      'Native Name',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.nativeName,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text(
                      'Phone Code',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.phoneCode,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: Text(
                      'Location',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.continent,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      'Capital',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.captial,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.attach_money),
                    title: Text(
                      'Currency',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.currency,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(
                      'Languages',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      value.languages.toString(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
