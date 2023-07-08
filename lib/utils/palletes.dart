import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  //dark theme colors
  static const darkScaffoldColor = Color(0xFF0C2539);
  static const darkIndicatorColor = Color(0xFF0C2539);
  static const darkSplashColor = Color(0XFFFCFAFF);

  //light theme colors
  static const lightScaffoldColor = Color(0XFFFCFAFF);
  static const lightIndicatorColor = Color(0xFF0C2539);
  static const lightSplashColor = Color(0xFF0C2539);

  //generally used colors for both light and dark
  static const warningColor = Color(0xFFC72C41);
  static const warningShapeColor = Color(0xFF801336);

  //Dark theming
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkScaffoldColor,
    splashColor: darkSplashColor,
    indicatorColor: darkIndicatorColor,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: Colors.white),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0XFFFCFAFF),
    ),
  );

  //Light theming
  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightScaffoldColor,
    splashColor: lightSplashColor,
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: Colors.white),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFF0C2539),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xFF0C2539),
      ),
    ),
  );
}
