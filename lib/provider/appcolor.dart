import 'package:flutter/material.dart';

class ColorThemeNotifier extends ChangeNotifier{
  Color _color = Colors.purple;

  Color get appColor => _color;

  changeColorTo (Color color){
    _color =color;
    notifyListeners();
  }
}