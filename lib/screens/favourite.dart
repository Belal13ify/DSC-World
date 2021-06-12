import 'package:flutter/material.dart';
import 'package:dsc_world/Controllers/favourites_controller.dart';
import 'package:dsc_world/Controllers/darkmode_controller.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'package:get/get.dart';

import 'country_info_screen.dart';

// this is the favourite screen to show the favourite countries that have been added

//Note: I added feature to delete the country from the favoruite screen by pressing the delete icon beside the country name

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //FAP to clear all countries in Favourite list
      floatingActionButton: GetBuilder<FavouritesControler>(
        builder: (value) => FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.delete_forever,
            size: 35,
          ),
          onPressed: () {
            value.deleteAllFav(context);
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Favourite Countries',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<FavouritesControler>(
                init: FavouritesControler(),
                builder: (value) => Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 15),
                  child: ListView.builder(
                      itemCount: value.favouriteList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var name = value.favouriteList[index];
                        var emoji = value.favouriteCountriesEmojis[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 5.0, right: 5.0, bottom: 8),
                          child: Card(
                            color: Color(0xff043551),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0)),
                            child: GetBuilder<Data>(
                              builder: (controller) => ListTile(
                                onTap: () async {
                                  await controller.getCountryInfo(name);
                                  Get.to(() => CountryInfo());
                                },
                                leading: Text(
                                  emoji,
                                  style: TextStyle(fontSize: 25),
                                ),
                                title: Text(
                                  name,
                                  // textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),

                                // Delete Icon that deletes the country on pressed
                                trailing: IconButton(
                                    onPressed: () async {
                                      //confirmation before deleting single favourite
                                      await value.showDialouge(
                                          context, name, emoji);
                                    },
                                    icon: GetBuilder<DarkModeControler>(
                                        builder: (controller) => Icon(
                                              Icons.delete_sharp,
                                              color: controller.isActive
                                                  ? Colors.white
                                                  : Colors.amber,
                                              size: 30,
                                            ))),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
