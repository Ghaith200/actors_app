import 'package:flutter/material.dart';
import 'dark_mode.dart'; // Import the dark theme
import 'light_mode.dart'; // Import the light theme

class ThemeProvider with ChangeNotifier {
  // Initialize the theme to light mode by default
  ThemeData _themeData = lightmode;
  
  // Getter to access the current theme
  ThemeData get themeData => _themeData;

  // Check if the current theme is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Setter to update the theme and notify listeners of changes
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Notify widgets listening to this provider to rebuild with the new theme
    notifyListeners();
  }

  // Method to toggle between light and dark themes
  void toggleTheme() {
    // If the current theme is light mode, switch to dark mode
    if (_themeData == lightmode) {
      themeData = darkMode;
    } 
    // Otherwise, switch to light mode
    else {
      themeData = lightmode;
    }
  }
}
