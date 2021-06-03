import 'package:get/get.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//Dark Mode Controlere

// Loading Data from the jSON
class Data extends GetxController {
  List<String> continents = [];
  List<String> countries = [];
  String continentName = '';
  String countryName = '';
  String nativeName = '';
  String phoneCode = '';
  String continent = '';
  String captial = '';
  String currency = '';
  List<dynamic> languages = [];
  String emoji = '';

  @override
  void onInit() {
    getContinents();
    super.onInit();
  }

  Future decodeJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    final data = json.decode(jsonString);
    return data;
  }

  Future<void> getContinents() async {
    var data = await decodeJson();
    var continentJson = data['continents'];
    continentJson.forEach((k, v) {
      continents.add(v);
    });
    update();
  }

  Future<void> getCountries(String continent) async {
    var data = await decodeJson();
    countries = [];
    var continentJson = data['continents'];
    var countriesjSON = data['countries'];

    countriesjSON.forEach((k, v) {
      //parsing countries and matching the pressed continent
      if (continentJson[v['continent']] == continent) {
        countries.add(v['name']);
      }
    });
    continentName = continent;
    update();
  }

  Future<void> getCountryInfo(String country) async {
    var data = await decodeJson();
    var countriesjSON = data['countries'];
    countriesjSON.forEach((k, v) {
      if (v['name'] == country) {
        countryName = country;
        nativeName = v['native'];
        phoneCode = v['phone'];
        continent = v['continent'];
        captial = v['capital'];
        currency = v['currency'];
        languages = v['languages'];
        emoji = v['emoji'];
      }
    });
  }
}
