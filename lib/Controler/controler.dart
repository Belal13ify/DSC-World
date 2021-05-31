import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DarkModeControler extends GetxController {
  RxBool isActive = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isActive.value = box.read('isDark');
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void changeMode() {
    isActive.value = !isActive.value;
    // box.write('isDark', isActive.value);
  }
}
