import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Add_Goal.dart';
import 'HomePage.dart';
import 'Rewards.dart';
import 'Settings.dart';
import 'friends.dart';

List<Widget> UserHobbyList = [];
int count = 0;
int limit = 2;

double progress = 0.75;

class PersonalPage extends StatefulWidget {
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
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
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Personal",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: TextColour)),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FriendsSection()));
              },
              child: FaIcon(
                FontAwesomeIcons.user,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.22,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: themeColour,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Row(
              children: [
                Image(
                  image: AssetImage('assets/TotalCompletion.png'),
                  filterQuality: FilterQuality.high,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 35.0),
                      child: Text(
                        "Total Progress",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 25.0),
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            value: progress,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 25.0),
                          child: Text(
                            "${progress * 100}%",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25.0),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: limit,
            children: UserHobbyList,
          )),
        ],
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Rewards()));
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
        ),
      ),
    );
  }
}
