import 'package:dsc_world/Controllers/favourites_controller.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountryInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Data>(
      builder: (value) => Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xffF44236),
              title: Text(value.countryName,
                  style: TextStyle(fontSize: 22, color: Colors.white)),
              centerTitle: true,
              actions: [
                GetBuilder<FavouritesControler>(
                  builder: (controller) => IconButton(
                    onPressed: () async {
                      await controller.checkfavourite(value.countryName);
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  value.emoji,
                  style: TextStyle(fontSize: 100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Native Name: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      value.nativeName,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Phone Code: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.phoneCode,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Located in: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.continentName,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Capital: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.captial,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Currency: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.currency,
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Languages: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      value.languages.toString(),
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
