import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/Themes/theme_services.dart';
import 'app/routes/app_pages.dart';
import 'app/Themes/theme_light_dark.dart';
import 'package:get_storage/get_storage.dart';
import 'app/utils/dependency_injection.dart';

void main() async {
  await GetStorage.init();
  DependencyInjection.init();

  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeService().getThemeMode,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
