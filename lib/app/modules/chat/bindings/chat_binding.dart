import 'package:get/get.dart';

import 'package:finanzas_personales/app/modules/chat/providers/socket_provider.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SocketController>(
      () => SocketController(),
    );
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
