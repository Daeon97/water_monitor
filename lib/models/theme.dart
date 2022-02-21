import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class Theme {
  ThemeData themeData;

  Theme({required this.themeData});

  factory Theme.fromMode({required utils.Theme theme}) {
    switch (theme) {
      case utils.Theme.light:
        return Theme(
          themeData: ThemeData(
            appBarTheme: const AppBarTheme(
              color: utils.baseColor,
              actionsIconTheme: IconThemeData(
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    utils.largePadding,
                  ),
                  bottomRight: Radius.circular(
                    utils.largePadding,
                  ),
                ),
              ),
            ),
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              circularTrackColor: Colors.transparent,
            ),
          ),
        );
      default:
        return Theme(themeData: ThemeData());
    }
  }
}
