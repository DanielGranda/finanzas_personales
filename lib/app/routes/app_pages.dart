import 'package:finanzas_personales/app/modules/SingIn/views/landing_page_view.dart';
import 'package:get/get.dart';

import 'package:finanzas_personales/app/modules/SingIn/bindings/sing_in_binding.dart';
import 'package:finanzas_personales/app/modules/SingIn/views/sing_in_view.dart';
import 'package:finanzas_personales/app/modules/category/bindings/category_binding.dart';
import 'package:finanzas_personales/app/modules/category/views/category_view.dart';
import 'package:finanzas_personales/app/modules/chat/bindings/chat_binding.dart';
import 'package:finanzas_personales/app/modules/chat/views/chat_view.dart';
import 'package:finanzas_personales/app/modules/home/bindings/home_binding.dart';
import 'package:finanzas_personales/app/modules/home/views/home_view.dart';
import 'package:finanzas_personales/app/modules/login/bindings/login_binding.dart';
import 'package:finanzas_personales/app/modules/login/views/login_view.dart';
import 'package:finanzas_personales/app/modules/real_chat/bindings/real_chat_binding.dart';
import 'package:finanzas_personales/app/modules/real_chat/views/real_chat_view.dart';
import 'package:finanzas_personales/app/modules/theme/bindings/theme_binding.dart';
import 'package:finanzas_personales/app/modules/theme/views/theme_view.dart';
import 'package:finanzas_personales/app/modules/user_preferences/bindings/user_preferences_binding.dart';
import 'package:finanzas_personales/app/modules/user_preferences/views/user_preferences_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      transition: Transition.zoom,
      transitionDuration: Duration(seconds: 2),
      opaque: true,
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
      name: _Paths.SING_IN,
      page: () => SingInView(),
      binding: SingInBinding(),
    ),
    GetPage(
      name: _Paths.THEME,
      page: () => ThemeView(),
      binding: ThemeBinding(),
    ),
    GetPage(
      name: _Paths.USER_PREFERENCES,
      page: () => UserPreferencesView(),
      binding: UserPreferencesBinding(),
    ),
    GetPage(
      name: _Paths.REAL_CHAT,
      page: () => RealChatView(),
      binding: RealChatBinding(),
    ),
    GetPage(
      name: _Paths.LANDINGPAGE,
      page: () => LandingPageView(),
      binding: SingInBinding(),
    ),
  ];
}
