import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class Theme {
  ThemeData themeData;

  Theme({required this.themeData});

  factory Theme.fromMode({required utils.Theme theme}) {
    switch (theme) {
      case utils.Theme.light:
        return Theme(themeData: ThemeData());
      default:
        return Theme(themeData: ThemeData());
    }
  }
}
