import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StockPile',
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: GoogleFonts.raleway(
            textStyle: const TextStyle(color: Colors.white),
            fontWeight: FontWeight.w500,
            //fontSize: 20,
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFF0C2539),
        ),
        indicatorColor: Color(0xFF0C2539),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0C2539),
        ),
      ),
       home: const MyHomePage(),
      //home: const AweseomSnackBarExample(),
    );
  }
}
