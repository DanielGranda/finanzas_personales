import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _themeData = GetStorage();
  final _storageThemeKey = 'isDarkMode';

  ThemeMode get getThemeMode =>
      _isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;

  bool _isSavedDarkMode() => _themeData.read(_storageThemeKey) ?? false;

  void _saveThemeMode(bool isDarkMode) =>
      _themeData.write(_storageThemeKey, isDarkMode);

  void changeThemeMode() {
    Get.changeThemeMode(_isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeMode(!_isSavedDarkMode());
    print('Color ✅ ');
  }
}
