import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red,
  accentColor: Colors.pink,
  scaffoldBackgroundColor: const Color(0xfff1f1ff),
  textTheme: ThemeData.light().textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          //fontFamily: 'RobotoCondensed',
        ),
      ),
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.red,
  accentColor: Colors.pink,
  textTheme: ThemeData.dark().textTheme.copyWith(
        headline6: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700,
          //fontFamily: 'RobotoCondensed',
        ),
      ),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _prefs;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  Future<void> _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}
