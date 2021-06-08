import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
//Favourite List Controler that controlls favourite countries in the favourite screen

class FavouritesControler extends GetxController {
  List<String> favouriteList = [];
  List<String> favouriteCountriesEmojis = [];
  @override
  void onInit() {
    getFavouriteCountries();
    super.onInit();
  }

  Future<void> getFavouriteCountries() async {
    // shared prefernces to load the favourite list from local storage with key, and value
    final prefs = await SharedPreferences.getInstance();

    favouriteList = prefs.getStringList('favouriteList') ?? [];
    favouriteCountriesEmojis = prefs.getStringList('favEmoji') ?? [];

    update();
  }

//checking if country is favourite or not and then toggle it in the favourite list
  Future<void> checkfavourite(String country, String emoji) async {
    final prefs = await SharedPreferences.getInstance();
    bool isFavourite = favouriteList.contains(country);

    if (isFavourite) {
      favouriteList.remove(country);
      favouriteCountriesEmojis.remove(emoji);
      prefs.setStringList('favouriteList', favouriteList);
      prefs.setStringList('favEmoji', favouriteCountriesEmojis);
    } else {
      favouriteList.add(country);
      favouriteCountriesEmojis.add(emoji);
      prefs.setStringList('favouriteList', favouriteList);
      prefs.setStringList('favEmoji', favouriteCountriesEmojis);
    }

    update();
  }

  //checking if the star Icon is favourite or not, toggle between them for the pressed country
  bool checkIconFavourite(String country) {
    return favouriteList.contains(country) ? true : false;
  }

  ///Confirmation Dialouge before deleting single country
  Future<void> showDialouge(context, String country, String emoji) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete From Favourites?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                    'Would you like to Delete $country from Favourite Countries?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                await deleteFromFavScreen(country, emoji);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//Delete single country from favourite based on the pressed country
  Future<void> deleteFromFavScreen(String country, String emoji) async {
    final prefs = await SharedPreferences.getInstance();
    favouriteList.remove(country);
    favouriteCountriesEmojis.remove(emoji);
    prefs.setStringList('favouriteList', favouriteList);
    prefs.setStringList('favEmoji', favouriteCountriesEmojis);
    update();
  }

  //Delete All Favourites
  Future<void> deleteAllFav(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete all Favourite Countries?!'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                    'Warning!, You are about to delete all Favourites from the list'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                favouriteList.clear();
                favouriteCountriesEmojis.clear();
                prefs.setStringList('favouriteList', favouriteList);
                prefs.setStringList('favEmoji', favouriteCountriesEmojis);
                update();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
