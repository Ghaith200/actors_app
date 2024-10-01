import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  ThemeProvider() {
    loadThemeFromPreferences();
  }

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    _saveThemeToPreferences(themeData == darkMode);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkMode;
    } else {
      themeData = lightmode;
    }
  }
  Future<void> _saveThemeToPreferences(bool isDarkMode) async {
    final prefrans = await SharedPreferences.getInstance();
    prefrans.setBool('isDarkMode', isDarkMode);
  }

  
  Future<void> loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode') ?? false;
    _themeData = isDarkMode ? darkMode : lightmode;
    notifyListeners();
  }
}
