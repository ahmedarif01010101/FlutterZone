import "package:flutter/material.dart";
import "light_theme.dart";
import "dark_theme.dart";

class ThemeProvider extends ChangeNotifier
{
  ThemeData _themeData = lightTheme;

  ThemeData get themedata => _themeData;

  bool get isDarkTheme => _themeData == darkTheme;

  set themeData (ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme()
  {
    if(_themeData == lightTheme)
    {
      themeData = darkTheme;
    }
    else
    {
      themeData = lightTheme;
    }
  }
}
