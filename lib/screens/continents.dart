import 'package:dsc_world/models/data.dart';
import 'package:dsc_world/widgets/continent_container.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

import 'countries_screen.dart';

class Continents extends StatefulWidget {
  @override
  _ContinentsState createState() => _ContinentsState();
}

class _ContinentsState extends State<Continents> {
  List continents = [];
  List paths = [];

  Data data = Data();

  void loadingContinents() async {
    continents = await data.getContinents();
    paths = await data.getImagesPath();
    setState(() {});
  }

  @override
  void initState() {
    loadingContinents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return StaggeredGridView.countBuilder(
    //   crossAxisCount: 2,
    //   crossAxisSpacing: 20.0,
    //   itemCount: continents.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     String continent = continents[index];
    //     return ContinentContainer(
    //       imagePath: 'assets/images/africa.png',
    //       continent: continent,
    //     );
    //   },
    //   staggeredTileBuilder: (int index) =>
    //       StaggeredTile.count(index == continents.length - 1 ? 2 : 1, 1),
    // );
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 5, childAspectRatio: 3 / 2),
        itemCount: continents.length,
        itemBuilder: (BuildContext context, int index) {
          String continent = continents[index];
          String path = paths[index];

          return ContinentContainer(
            continent: continent,
            imagePath: path,
            pressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Countries(continent: continent)));
              print(continent);
            },
          );
        });
  }
}
