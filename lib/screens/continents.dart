import 'package:dsc_world/models/data.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/material.dart';
import 'dart:convert';

class Continents extends StatefulWidget {
  @override
  _ContinentsState createState() => _ContinentsState();
}

class _ContinentsState extends State<Continents> {
  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future decodeJson() async {
    String jsonString = await loadJson();
    final data = json.decode(jsonString);
    // print(data);
    // for (String value in data['continents'].values) {
    //   // setState(() {
    //   continents.add(value);
    // });
    // }
    return data;
  }

  List continents = [];
  Future<void> getContinents() async {
    var data = await decodeJson();
    // List continents = [];
    for (String value in data['continents'].values) {
      setState(() {
        continents.add(value);
      });
    }
    // print(continents);
    // return continents;
  }

  @override
  void initState() {
    decodeJson();
    getContinents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var continents = data["continents"];
    // var cont = getContinents();
    // print(cont);
    return ListView.builder(
        itemCount: continents.length,
        itemBuilder: (BuildContext context, int index) {
          String continent = continents[index];

          return new Column(
            children: <Widget>[
              new ListTile(
                leading: CircleAvatar(
                  child: new Icon(Icons.account_box),
                ),
                title: Text(continent),
              ),
              Divider(),
            ],
          );
        });
  }
}
