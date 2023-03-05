import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/home.dart';

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
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: Color(0xFF0C2539),
        ),
        indicatorColor: Color(0xFF0C2539),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF0C2539),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
