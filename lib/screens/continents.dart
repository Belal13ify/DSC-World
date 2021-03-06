import 'package:dsc_world/widgets/continent_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'countries_screen.dart';

//continents screens that shows grid view builder of the continents sent from the json file

class Continents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Data>(
        builder: (value) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Wrap(
                spacing: 20,
                runSpacing: 15,
                alignment: WrapAlignment.spaceEvenly,
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
            ));
  }
}
