import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final appData = GetStorage();
  bool isDarkMode = true;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  changeThem(bool isDarkMode) {
    return appData.write('darkmode', isDarkMode);
  }
}
