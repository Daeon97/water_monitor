import 'package:flutter/material.dart';
import '../utils/utils.dart' as utils;

class Theme {
  ThemeData themeData;

  Theme({required this.themeData});

  factory Theme.fromMode({required utils.Theme theme}) {
    if (theme == utils.Theme.light) {
      return Theme(
        themeData: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
            actionsIconTheme: IconThemeData(
              color: utils.lightModeBaseColor,
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
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  utils.padding + utils.smallPadding,
                ),
                topRight: Radius.circular(
                  utils.padding + utils.smallPadding,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Theme(
        themeData: ThemeData(
          scaffoldBackgroundColor: utils.darkModeBaseColor,
          appBarTheme: const AppBarTheme(
            color: utils.darkModeBaseColor,
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
          switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            trackColor: MaterialStateProperty.all<Color>(
              Colors.white38,
            ),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  utils.padding + utils.smallPadding,
                ),
                topRight: Radius.circular(
                  utils.padding + utils.smallPadding,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
