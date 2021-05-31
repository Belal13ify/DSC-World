import 'package:dsc_world/models/data.dart';
import 'package:dsc_world/widgets/continent_container.dart';
import 'package:flutter/material.dart';

import 'countries_screen.dart';

class Continents extends StatefulWidget {
  @override
  _ContinentsState createState() => _ContinentsState();
}

class _ContinentsState extends State<Continents> {
  List continents = [];
  List countries = [];

  Data data = Data();

  void loadingContinents() async {
    continents = await data.getContinents();

    setState(() {});
  }

  void loadingCountries(continent) async {
    countries = await data.getCountries(continent);
  }

  @override
  void initState() {
    loadingContinents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.symmetric(horizontal: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 3 / 2),
      children: continents.map((continent) {
        return ContinentContainer(
            continent: continent,
            imagePath: 'assets/images/$continent.png',
            pressed: () {
              setState(() {
                loadingCountries(continent);
              });
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Countries(
                          continent: continent, countries: countries)));
            });
      }).toList(),
    );
  }
}
