import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:goalship/welcome.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoalShip',
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19.0),
          elevation: 0.0,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color(0xA63DC5DB))
            .copyWith(background: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(
          splashTransition: SplashTransition.scaleTransition,
          curve: Curves.decelerate,
          splash: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(
                    'assets/target.png',
                  ),
                  width: 40.0,
                  height: 40.0,
                ),
                Text(
                  "GoalShip",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          nextScreen: Main(),
        ),
      ),
    );
  }
}
