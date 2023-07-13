import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockpile/home.dart';
import 'package:stockpile/utils/app_theme.dart';
import 'package:stockpile/utils/theme_provider.dart';

//App aplash screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetointro();
  }

  @override
  //Splash Screen
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (
              context,
              WidgetRef ref,
              child,
            ) {
              final appThemeMode = ref.watch(appThemeChangeNotifierProvider);

              return Image.asset(
                'images/stockpile.png',
                color: appThemeMode.isDarkModeEnabled
                    ? AppTheme.lightColor
                    : AppTheme.darkColor,
                width: 250,
                height: 250,
              );
            }),
          ],
        ),
      ),
    );
  }

  //Navigate to Intro Screen PageView
  void _navigatetointro() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    // PageNavigator(ctx: context).nextPageOnly(page: const Intro());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyHomePage(),
      ),
    );
  }
}
