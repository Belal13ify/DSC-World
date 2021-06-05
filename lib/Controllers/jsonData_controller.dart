import 'package:get/get.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

//Controlls Data comming from the Json file
class Data extends GetxController {
  List<String> continents = [];
  List<String> countries = [];

  List<String> countriesFilter = [];
  List<String> emojies = [];
  bool searchIsActive = false;
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

  // decoding the Json file to string
  Future decodeJson() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    final data = json.decode(jsonString);
    return data;
  }

  // parsing continents on splash screen and updating the variable List<String> continents

  Future<void> getContinents() async {
    var data = await decodeJson();
    var continentJson = data['continents'];
    continentJson.forEach((k, v) {
      continents.add(v);
    });
    update();
  }

//Parsing countries based on the pressed continent and updateing List countries vavriable

  Future<void> getCountries(String continent) async {
    var data = await decodeJson();
    countries = [];
    emojies = [];
    var continentJson = data['continents'];
    var countriesjSON = data['countries'];

    countriesjSON.forEach((k, v) {
      //parsing countries and matching the pressed continent
      if (continentJson[v['continent']] == continent) {
        countries.add(v['name']);
        emojies.add(v['emoji']);
      }
    });
    continentName = continent;
    update();
  }

  // loading single country information based on the pressed country
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

// Search method to search for a country based on the query sent in the search field
  void search(String query) {
    countriesFilter = countries.where((country) {
      final countryLower = country.toLowerCase();
      final queryLower = query.toLowerCase();
      return countryLower.contains(queryLower);
    }).toList();

    update();
  }

  void toggleSearch() {
    searchIsActive = !searchIsActive;
    update();
  }
}
