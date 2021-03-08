import 'package:get/get.dart';

import '../controllers/real_chat_controller.dart';

class RealChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealChatController>(
      () => RealChatController(),
    );
  }
}
