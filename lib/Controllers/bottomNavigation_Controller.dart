import 'package:get/get.dart';

// controlls the current Navigation bar

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  @override
  void onInit() {
    selectedIndex = 0;
    super.onInit();
  }

  void onItemTapped(index) {
    selectedIndex = index;
    update();
  }
}
