import 'package:dsc_world/widgets/continent_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'countries_screen.dart';

//continents screens that shows grid view builder of the continents sent from the json file

class Continents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceheight = MediaQuery.of(context).size.height;
    return GetBuilder<Data>(
      builder: (value) => GridView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 5,
            childAspectRatio: 2.5 * deviceWidth / deviceheight),
        children: value.continents.map((continent) {
          return ContinentContainer(
              continent: continent,
              //parsing continent images with variable continent name
              imagePath: 'assets/images/$continent.png',
              pressed: () async {
                await value.getCountries(continent);
                //Navigates to countries page with GETX state management
                Get.to(() => Countries());
              });
        }).toList(),
      ),
    );
  }
}
