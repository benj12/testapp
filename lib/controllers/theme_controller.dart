import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  
  final _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  static const String _themeKey = 'theme_mode';
  late SharedPreferences _prefs;

  // Define theme data
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blue,
      secondary: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
  );

  @override
  void onInit() {
    super.onInit();
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    _prefs = await SharedPreferences.getInstance();
    final savedThemeMode = _prefs.getString(_themeKey);
    
    if (savedThemeMode == null) {
      // If no saved preference, use system theme
      final systemTheme = WidgetsBinding.instance.window.platformBrightness;
      _isDarkMode.value = systemTheme == Brightness.dark;
    } else {
      _isDarkMode.value = savedThemeMode == 'dark';
    }
    
    _updateThemeMode();
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    _updateThemeMode();
    _saveThemeMode();
  }

  void _updateThemeMode() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    Get.changeTheme(_isDarkMode.value ? darkTheme : lightTheme);
  }

  Future<void> _saveThemeMode() async {
    await _prefs.setString(_themeKey, _isDarkMode.value ? 'dark' : 'light');
  }
} 