import 'package:get/get.dart';

import 'package:finanzas_personales/app/modules/home/controllers/bottom_navigation_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
