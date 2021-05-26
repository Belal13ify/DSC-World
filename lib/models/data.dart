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

    for (String continent in data['continents'].values) {
      continents.add(continent);
    }
    return continents;
  }
}
