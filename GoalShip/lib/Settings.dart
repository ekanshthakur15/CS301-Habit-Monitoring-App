import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/profileSettings.dart';

import 'Add_Goal.dart';
import 'Calender.dart';
import 'HomePage.dart';
import 'Personal.dart';
import 'friends.dart';
import 'login.dart';

Color themeColour2 = Color(0xFFADE7EE);
Color TextColour = Color(0xFF0000000);

class Settings_Page extends StatefulWidget {
  final String token;
  const Settings_Page({required this.token});
  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  @override
  Widget build(BuildContext context) {
    var _username = 'Pratik';
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(token: widget.token)));
                    },
                    child: FaIcon(
                      Icons.arrow_back_ios,
                      color: TextColour,
                      size: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                        color: TextColour,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                ],
              ),
            ],
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    "Hello, $_username",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  width: 70.0,
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0, right: 10.0),
                  child: Image.asset(
                    "assets/user_male.png",
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 30),
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: themeColour2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FriendsSection(token: widget.token)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Social",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 70.0,
                          ),
                          FaIcon(Icons.navigate_next_sharp)
                        ],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileSettings(token: widget.token),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Profile Settings",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 26.0,
                          ),
                          Text(
                            "${_username}",
                            selectionColor: Colors.black12,
                            style: TextStyle(color: Colors.black45),
                          ),
                          FaIcon(Icons.navigate_next_sharp)
                        ],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Notifications",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 70.0,
                          ),
                          FaIcon(Icons.navigate_next_sharp),
                        ],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Privacy Policy",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 70.0,
                          ),
                          FaIcon(Icons.navigate_next_sharp),
                        ],
                      ),
                    )),
                    Expanded(
                        child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms & Conditions",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FaIcon(Icons.navigate_next_sharp)
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 50.0,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF40C5DB)),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: themeColour2),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //1
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(token: widget.token)));
                    });
                  },
                  child: Icon(
                    Icons.home,
                    color: Colors.black,
                    size: 30.0,
                  )),
              //2
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Calender_Page(token: widget.token)));
                    });
                  },
                  child: FaIcon(
                    Icons.emoji_events_rounded,
                    color: Colors.black,
                    size: 28.0,
                  )),
              //3
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: GestureDetector(
                  onTap: () {
                    showAddGoal(context, "");
                  },
                  child: CircleAvatar(
                    backgroundColor: themeColour,
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                      size: 35.0,
                    ),
                  ),
                ),
              ),
              //4
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PersonalPage(token: widget.token)));
                    });
                  },
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.black,
                    size: 24.0,
                  )),
              //5
              GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Settings_Page(token: widget.token)));
                    });
                  },
                  child: FaIcon(
                    Icons.settings,
                    color: Colors.black,
                    size: 30.0,
                  )),
            ],
          )),
    );
  }
}
