import 'package:flutter/material.dart';

class WrapperProvider extends ChangeNotifier
{
  bool  _isLoginPage = true;

  bool get isLoginPage => _isLoginPage;

  void toggleBetween()
  {
    _isLoginPage = !_isLoginPage;
    print(_isLoginPage);
    notifyListeners();
  }
}