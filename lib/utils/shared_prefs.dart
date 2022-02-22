import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart' as models;
import 'enums.dart' as enums;

const _themeKey = 'themeKey';

Future<SharedPreferences> get _sharedPreferences =>
    SharedPreferences.getInstance();

void setTheme(enums.Theme theme) async {
  SharedPreferences sp = await _sharedPreferences;
  sp.setString(_themeKey, theme.name);
}

Future<Set> getTheme() async {
  SharedPreferences sp = await _sharedPreferences;
  return sp.getString(_themeKey) == null ||
          sp.getString(_themeKey) == enums.Theme.light.name
      ? {
          models.Theme.fromMode(theme: enums.Theme.light),
          enums.Theme.light,
        }
      : {
          models.Theme.fromMode(theme: enums.Theme.dark),
          enums.Theme.dark,
        };
}
