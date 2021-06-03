import 'package:dsc_world/widgets/continent_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsc_world/Controllers/jsonData_controller.dart';
import 'countries_screen.dart';

class Continents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Data>(
      builder: (value) => GridView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 3 / 2),
        children: value.continents.map((continent) {
          return ContinentContainer(
              continent: continent,
              imagePath: 'assets/images/$continent.png',
              pressed: () async {
                await value.getCountries(continent);

                Get.to(() => Countries());
              });
        }).toList(),
      ),
    );
  }
}
