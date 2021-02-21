import 'package:get/get.dart';

import 'package:finanzas_personales/app/modules/category/bindings/category_binding.dart';
import 'package:finanzas_personales/app/modules/category/views/category_view.dart';
import 'package:finanzas_personales/app/modules/chat/bindings/chat_binding.dart';
import 'package:finanzas_personales/app/modules/chat/views/chat_view.dart';
import 'package:finanzas_personales/app/modules/home/bindings/home_binding.dart';
import 'package:finanzas_personales/app/modules/home/views/home_view.dart';
import 'package:finanzas_personales/app/modules/login/bindings/login_binding.dart';
import 'package:finanzas_personales/app/modules/login/views/login_view.dart';
import 'package:finanzas_personales/app/modules/theme/bindings/theme_binding.dart';
import 'package:finanzas_personales/app/modules/theme/views/theme_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.CHAT;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemeView(),
      binding: ThemeBinding(),
    ),
  ];
}
