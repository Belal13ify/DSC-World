import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Data {
  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future decodeJson() async {
    String jsonString = await loadJson();
    final data = json.decode(jsonString);

    return data;
  }

  Future<List> getContinents() async {
    List continents = [];
    var data = await decodeJson();

    var continentJson = data['continents'];

    continentJson.forEach((k, v) {
      continents.add(v);
    });

    return continents;
  }

  Future<List> getCountries(String continent) async {
    List countries = [];
    var data = await decodeJson();
    var continentJson = data['continents'];
    var countriesjSON = data['countries'];

    countriesjSON.forEach((k, v) {
      //parsing countries and matching the pressed continent
      if (continentJson[v['continent']] == continent) {
        countries.add(v['name']);
      }
    });

    return countries;
  }
}
