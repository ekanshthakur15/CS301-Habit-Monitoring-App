import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.black,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 19.0),
            elevation: 0.5),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Color(0xA63DC5DB))
            .copyWith(background: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedSplashScreen(
          splash: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/target.png'),
                height: 35.0,
                width: 35.0,
              ),
              Text(
                "GoalShip",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          nextScreen: HomePage(),
        ),
      ),
    );
  }
}
