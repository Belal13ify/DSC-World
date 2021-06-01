import 'package:flutter/material.dart';
import 'package:dsc_world/Controllers/favourites_controller.dart';
import 'package:get/get.dart';

class Favourite extends StatelessWidget {
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
                  'Favourite Countries',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Expanded(
              child: GetBuilder<FavouritesControler>(
                init: FavouritesControler(),
                builder: (value) => ListView.builder(
                    itemCount: value.favouriteList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var name = value.favouriteList[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 10),
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
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
