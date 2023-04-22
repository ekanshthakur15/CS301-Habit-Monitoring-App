import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'HomePage.dart';
import 'Personal.dart';
import 'Settings.dart';
import 'login.dart';

class ProfileSettings extends StatefulWidget {
  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

List<String> imageLink = [
  'assets/user_male.png',
  'assets/user_male_adult.png',
  'assets/user_female.png',
  'assets/user_female_adult.png',
];

int no_of_goals = UserHobbyList.length;

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeColour,
        elevation: 0.0,
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: FaIcon(
            Icons.arrow_back_ios,
            color: TextColour,
            size: 25.0,
          ),
        ),
        titleSpacing: -5.0,
        title: Text(
          "Profile Settings",
          style: TextStyle(
            color: TextColour,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: themeColour.withOpacity(0.5),
              ),
              height: 240.0,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 25.0),
                          child: Image.asset(
                            imageLink.elementAt(0),
                            width: 100.0,
                            height: 100.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, top: 59.0),
                          child: Text(
                            "${userName.text}",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Total number",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                                Text(
                                  "of goals",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0),
                                ),
                              ],
                            ),
                            Text(
                              ":",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                            Text(
                              "$no_of_goals",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Text(
                          "Rewards earned : 0",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13.0),
                        )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}

/*
Text(
                            "Total number of Goals : $no_of_goals",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
 */
