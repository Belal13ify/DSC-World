import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //checking if the star Icon is favourite or not, toggle between them for the pressed conuntry
  bool checkIconFavourite(String country) {
    return favouriteList.contains(country) ? true : false;
  }

//Delete country from favourite based on the pressed country
  Future<void> deleteFromFavScreen(String country) async {
    final prefs = await SharedPreferences.getInstance();
    favouriteList.remove(country);
    prefs.setStringList('favouriteList', favouriteList);
    prefs.setStringList('favEmoji', favouriteCountriesEmojis);
    update();
  }
}
