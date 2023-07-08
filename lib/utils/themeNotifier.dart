import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/utils/palletes.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;

  //by default it's set here to dark mode
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(Pallete.darkModeAppTheme) {
    getTheme();
  }

  void getTheme() async {
    //use shared preference
  }

  void toggleTheme() async {
    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }
}
