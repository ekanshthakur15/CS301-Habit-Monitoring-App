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
    backgroundColor: Colors.white12.withOpacity(1.0),
    builder: (_) {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(144, 206, 216, 0.16),
                Color.fromRGBO(205, 235, 241, 0.8),
                Color.fromRGBO(41, 94, 118, 0.8),
              ]),
          // borderRadius: BorderRadius.circular(50.0),
        ),
        height: MediaQuery.of(ctx).size.height * 0.7,
        child: Login(),
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
                  image: AssetImage('assets/login.jpg'),
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover),
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
                              color: Colors.black38),
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
background:
linear-gradient(
180deg, rgba(144, 206, 216, 0.16) 0%,
rgba(205, 235, 241, 0.8) 0.01%,
rgba(41, 94, 118, 0.8) 100%);

 */
