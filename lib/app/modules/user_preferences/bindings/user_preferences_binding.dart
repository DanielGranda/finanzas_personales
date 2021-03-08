import 'package:get/get.dart';

import '../controllers/user_preferences_controller.dart';

class UserPreferencesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserPreferencesController>(
      () => UserPreferencesController(),
    );
  }
}
