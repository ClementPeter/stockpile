// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:stockpile/home.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'StockPile',
//       theme: ThemeData(
//         snackBarTheme: SnackBarThemeData(
//           contentTextStyle: GoogleFonts.raleway(
//             textStyle: const TextStyle(color: Colors.white),
//             fontWeight: FontWeight.w500,
//             //fontSize: 20,
//           ),
//         ),
//         textSelectionTheme: const TextSelectionThemeData(
//           selectionHandleColor: Color(0xFF0C2539),
//         ),
//         indicatorColor: Color(0xFF0C2539),
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           secondary: const Color(0xFF0C2539),
//         ),
//       ),
//        home: const MyHomePage(),
//       //home: const AweseomSnackBarExample(),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

//WidgetBinding Oberver must be implemeented to use "didChangeAppLifeCylce"
class _HomeState extends State<Home> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    WidgetsBinding.instance.addObserver(this);
  }

  //Monitors OUR App state / lifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Home",
        style: TextStyle(fontSize: 22),
      )),
    );
  }
}
