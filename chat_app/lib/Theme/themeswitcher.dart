import 'package:flutter/material.dart';
import "./light_theme.dart";
import "./dark_theme.dart";

class ThemeSwitcher extends ChangeNotifier
{
  ThemeData _themeData = lightTheme;

  ThemeData get theme => _themeData;

  bool get isDark => _themeData == darkTheme;

  void toggle()
  {
    if(_themeData == lightTheme)
    {
      setTheme = darkTheme;
    }
    else
    {
      setTheme = lightTheme;
    }
  }

   set setTheme (ThemeData theme)
  {
    _themeData = theme;
    notifyListeners();
  }
}