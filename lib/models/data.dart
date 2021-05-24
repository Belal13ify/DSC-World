import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class Data {
  List continents = [];

  Future<String> loadJson() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future decodeJson() async {
    String jsonString = await loadJson();
    final data = json.decode(jsonString);
    // print(data);
    for (String value in data['continents'].values) {
      // print(value);
      // continents.add(value);
    }
    return data;
  }

  void getContinents() async {
    var data = await decodeJson();
    data['continents'].forEach((k, v) {
      continents.add(v);
    });
  }
}
