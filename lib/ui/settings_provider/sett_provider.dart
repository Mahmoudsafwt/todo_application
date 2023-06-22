import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode currentMode = ThemeMode.dark;

  void changeMode(ThemeMode newMode) {
    if (currentMode == newMode) return;

    currentMode = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentMode == ThemeMode.dark ? true : false;
  }

  Color darkbackGroundColor() {
    if (currentMode == ThemeMode.light) {
      return const Color(0xffDFECDB);
    } else {
      return const Color(0xff060E1E);
    }
  }
}
