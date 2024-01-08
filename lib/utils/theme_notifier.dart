import 'package:db_example/utils/theme.dart';
import 'package:flutter/material.dart';



class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightThemeData;
  bool isLightTheme = true;

  void toggleTheme() {
    currentTheme = isLightTheme ? darkThemeData : lightThemeData;
    isLightTheme = !isLightTheme;
    notifyListeners();
  }
}