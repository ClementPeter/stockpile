import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stockpile/home.dart';
import 'package:stockpile/model/stockpile.dart';
import 'package:stockpile/providers/stockpile_changeNotifier.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp(),
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
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFF0C2539),
        ),
        //primaryColor: Color(0xFF0C2539),
        indicatorColor: Color(0xFF0C2539),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0C2539),
        ),

        //primarySwatch: Color(0xFF0C2539)
      ),
      home: const MyHomePage(),
    );
  }
}
