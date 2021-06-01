import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Favourite List Controler
class FavouritesControler extends GetxController {
  List<String> favouriteList = [];

  @override
  void onInit() {
    getFavouriteCountries();
    super.onInit();
  }

  Future<void> getFavouriteCountries() async {
    final prefs = await SharedPreferences.getInstance();

    favouriteList = prefs.getStringList('favouriteList') ?? [];

    update();
  }

  Future<void> checkfavourite(String country) async {
    final prefs = await SharedPreferences.getInstance();
    bool isFavourite = favouriteList.contains(country);

    if (isFavourite) {
      favouriteList.remove(country);
      prefs.setStringList('favouriteList', favouriteList);
    } else {
      favouriteList.add(country);
      prefs.setStringList('favouriteList', favouriteList);
    }

    update();
  }

  bool checkIconFavourite(String country) {
    return favouriteList.contains(country) ? true : false;
  }
}
