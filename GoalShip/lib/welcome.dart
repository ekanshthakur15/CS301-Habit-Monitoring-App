import 'dart:ui';

import 'package:flutter/material.dart';

import 'login.dart';

void main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  State<Main> createState() => _MainState();
}

void showLoginPage(BuildContext ctx) {
  showModalBottomSheet(
    context: ctx,
    backgroundColor: Colors.white.withOpacity(0.4),
    builder: (_) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
          ),
          height: MediaQuery.of(ctx).size.height * 0.7,
          child: Login(),
        ),
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    // shape: CircleBorder(),
  );
}

class _MainState extends State<Main> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mountain.jpg'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Swipe up ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          "to get",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Text(
                      "Going !!",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Center(
                    child: GestureDetector(
                      onVerticalDragStart: (DragStartDetails details) {},
                      onVerticalDragUpdate: (DragUpdateDetails details) {
                        showLoginPage(context);
                      },
                      child: Icon(
                        Icons.keyboard_double_arrow_up_sharp,
                        size: 50.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

/*
 */
