import 'package:flutter/material.dart';
import 'package:music_player/theme/dark_mode.dart';
import 'package:music_player/theme/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  //inital theme
  ThemeData _themeData = lightMode;

  //get theme
  ThemeData get themeData => _themeData;

  // dark theme
  bool get isDarkMode => _themeData == darkMode;

  // set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //update UI
    notifyListeners();
  }

  //toggle
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
