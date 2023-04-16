import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/signin.dart';

import 'Add_Goal.dart';
import 'Calender.dart';
import 'HomePage.dart';
import 'friends.dart';
import 'goals.dart';

Color themeColour2 = Color(0xFFCECBCB);
Color TextColour = Color(0xFF0000000);

class Settings_Page extends StatefulWidget {
  @override
  State<Settings_Page> createState() => _Settings_PageState();
}

class _Settings_PageState extends State<Settings_Page> {
  void showAddGoal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: MediaQuery.of(ctx).size.height * 1.0,
          child: Add_Goal(),
        );
      },
      useSafeArea: true,
      isScrollControlled: true,
      shape: CircleBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themeColour,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PersonalPage()));
                },
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: TextColour,
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(),
                  color: themeColour2,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 10.0,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                    )
                  ]),
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
                              builder: (context) => FriendsSection()),
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
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Profile Settings",
                            style: TextStyle(color: Colors.black),
                          ),
                          Text(
                            name.text,
                            selectionColor: Colors.black12,
                            style: TextStyle(color: Colors.black12),
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
              margin: EdgeInsets.all(30.0),
              height: 50.0,
              decoration: BoxDecoration(
                  color: themeColour,
                  border: Border.all(
                    color: themeColour,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
              child: TextButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    "LOG OUT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: themeBackGrnd),
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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
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
                              builder: (context) => Calender_Page()));
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
                    showAddGoal(context);
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
                              builder: (context) => PersonalPage()));
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
                              builder: (context) => Settings_Page()));
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
