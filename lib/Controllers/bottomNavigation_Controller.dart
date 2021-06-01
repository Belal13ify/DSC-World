import 'package:get/get.dart';

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
