import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalship/Rewards.dart';

class RewardDetails extends StatelessWidget {
  final String token;
  RewardDetails({required this.image, required this.token});
  final String image;

  MaterialColor primary = MaterialColor(
    0xFFBBE4E9,
    <int, Color>{
      50: Color(0xFFE3F6F8),
      100: Color(0xFFBCE9EE),
      200: Color(0xFF8DDCE3),
      300: Color(0xFF5ECFe0),
      400: Color(0xFF3DC7DC),
      500: Color(0xFF19BED9),
      600: Color(0xFF16AEC3),
      700: Color(0xFF139EAD),
      800: Color(0xFF118E97),
      900: Color(0xFF0D7274),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(250.0),
        child: AppBar(
          leading: CupertinoNavigationBarBackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Rewards(token: token),
                ),
              );
              // Add your navigation logic here
            },
          ),
          title: Text(
            'Rewards',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromWidth(50.0),
            child: Image.asset(
              image, // Replace with your own image asset
              height: 200.0,
              width: 200.0,
            ),
          ),
          backgroundColor: Color(0xFFBBE4E9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(600.0), // Set the bottom radius to 20.0
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                boxShadow: [],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Center(
                child: Text(
                  'Finished task 5 times a week ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Study',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Gym',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
            child: Container(
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                boxShadow: [],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Sleep',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
