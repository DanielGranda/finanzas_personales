import 'package:finanzas_personales/app/modules/SingIn/controllers/sing_in_controller.dart';
import 'package:finanzas_personales/app/modules/category/controllers/category_controller.dart';
import 'package:finanzas_personales/app/modules/chat/controllers/chat_controller.dart';
import 'package:finanzas_personales/app/modules/chat/providers/socket_provider.dart';
import 'package:finanzas_personales/app/modules/real_chat/controllers/real_chat_controller.dart';
import 'package:finanzas_personales/app/modules/theme/controllers/theme_controller.dart';
import 'package:finanzas_personales/app/modules/user_preferences/controllers/user_preferences_controller.dart';
import 'package:get/get.dart';

abstract class DependencyInjection {
  static void init() async {
    Get.lazyPut(() => SingInController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => SocketController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => UserPreferencesController());
    Get.lazyPut(() => RealChatController());
  }
}
