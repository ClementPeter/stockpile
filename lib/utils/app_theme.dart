import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// class Pallete {
//   //dark theme colors
//   static const darkScaffoldColor = Color(0xFF0C2539);
//   static const darkIndicatorColor = Color(0xFF0C2539);
//   static const darkSplashColor = Color(0XFFFCFAFF);

//   //light theme colors
//   static const lightScaffoldColor = Color(0XFFFCFAFF);
//   static const lightIndicatorColor = Color(0xFF0C2539);
//   static const lightSplashColor = Color(0xFF0C2539);

//   //generally used colors for both light and dark
//   static const warningColor = Color(0xFFC72C41);
//   static const warningShapeColor = Color(0xFF801336);

//   //Dark theming
//   static var darkModeAppTheme = ThemeData.dark().copyWith(
//     scaffoldBackgroundColor: darkScaffoldColor,
//     splashColor: darkSplashColor,
//     indicatorColor: darkIndicatorColor,
//     snackBarTheme: SnackBarThemeData(
//       contentTextStyle: GoogleFonts.raleway(
//         textStyle: const TextStyle(color: Colors.white),
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//     colorScheme: ColorScheme.fromSwatch().copyWith(
//       secondary: const Color(0XFFFCFAFF),
//     ),
//   );

//   //Light theming
//   static var lightModeAppTheme = ThemeData.light().copyWith(
//     scaffoldBackgroundColor: lightScaffoldColor,
//     splashColor: lightSplashColor,
//     snackBarTheme: SnackBarThemeData(
//       contentTextStyle: GoogleFonts.raleway(
//         textStyle: const TextStyle(color: Colors.black),
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//     colorScheme: ColorScheme.fromSwatch().copyWith(
//       secondary: const Color(0xFF0C2539),
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: TextButton.styleFrom(
//         foregroundColor: const Color(0xFF0C2539),
//       ),
//     ),
//   );
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

class AppTheme {
  //dark theme colors
  static const darkScaffoldColor = Color(0xFF0C2539);
  static const darkColor = Color(0xFF0C2539);
  static const darkIndicatorColor = Color(0xFF0C2539);
  static const darkSplashColor = Color(0XFFFCFAFF);

  //light theme colors
  static const lightScaffoldColor = Color(0XFFFCFAFF);
  static const lightColor = Color(0XFFFCFAFF);
  static const lightIndicatorColor = Color(0xFF0C2539);
  static const lightSplashColor = Color(0xFF0C2539);

  //generally used colors for both light and dark
  static const warningColor = Color(0xFFC72C41);
  static const warningShapeColor = Color(0xFF801336);

  //specify light theme properties
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightScaffoldColor,
    splashColor: lightSplashColor,
    appBarTheme: AppBarTheme(
      color: lightScaffoldColor,
      titleTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: darkColor),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      iconTheme: const IconThemeData(color: darkColor),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: darkColor),
    ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: lightColor),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFF0C2539),
    ),
  );

  //specfify dark theme properties
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkScaffoldColor,
    splashColor: lightSplashColor,
    appBarTheme: AppBarTheme(
      color: darkColor,
      //actionsIconTheme: IconThemeData(color: lightColor),
      titleTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: lightColor),
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      iconTheme: const IconThemeData(color: lightColor),
    ),
    //textTheme: TextTheme(
    //   displayLarge: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: lightColor),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   displayMedium: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: lightColor),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   displaySmall: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headlineLarge: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: lightColor),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headlineMedium: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headlineSmall: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   titleLarge: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   titleMedium: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   titleSmall: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   // displayMedium: GoogleFonts.raleway(
    //   //   textStyle: const TextStyle(color: Color(0x690C2539)),
    //   //   fontWeight: FontWeight.bold,
    //   //   fontSize: 25,
    //   // ),
    //   bodyMedium: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: lightColor),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   bodyLarge: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: lightColor),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headline4: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headline5: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    //   headline6: GoogleFonts.raleway(
    //     textStyle: const TextStyle(color: Color(0x690C2539)),
    //     fontWeight: FontWeight.bold,
    //     fontSize: 25,
    //   ),
    // ),
    snackBarTheme: SnackBarThemeData(
      contentTextStyle: GoogleFonts.raleway(
        textStyle: const TextStyle(color: lightColor),
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0XFFFCFAFF),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: lightColor,
      foregroundColor: lightColor,
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: lightColor,
      titleTextStyle: TextStyle(
        color: lightColor,
        fontSize: 19,
        fontWeight: FontWeight.w500,
      ),
    ),
    //primaryColor: darkColor,
  );
}
