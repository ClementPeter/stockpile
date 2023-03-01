import 'package:flutter/material.dart';
//
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0XFFFCFAFF),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/stockpile.png',
                    width: 250,
                    height: 250,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Navigate to Intro Screen PageView
  void _navigatetointro() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
   // PageNavigator(ctx: context).nextPageOnly(page: const Intro());
  // Navigator.push(context, MaterialPageRoute(builder: (context) => Intro()));
   
  }
}
