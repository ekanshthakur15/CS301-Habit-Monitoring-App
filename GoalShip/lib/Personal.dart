import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/GoalCard.dart';
import 'package:http/http.dart' as http;

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
  final String token;
  const PersonalPage({required this.token});
  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getGoal();
    print(data);
  }

  void CreateCard() {
    setState(() {
      UserHobbyList.clear();
      if (data.isNotEmpty) {
        var token2 = widget.token;
        for (var i = 1; i < data.length; i++) {
          var IconId = data[i]['icon'];
          var Name = data[i]['name'];
          var goal_id = data[i]['id'];
          var progress = data[i]['progress_amount'];
          setState(() {
            UserHobbyList.add(GoalCard(
              GoalIconId: IconId,
              GoalName: Name,
              id: goal_id,
              token: token2,
              totalProgress: progress,
            ));
          });
        }
      } else {
        print('data is empty');
      }
    });
    print(data);
  }

  Future<void> getGoal() async {
    var token1 = widget.token;
    var response = await http.get(
      Uri.parse('http://10.0.2.2:8000/personal_progress/'),
      headers: {'Authorization': 'Token $token1'},
    );
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          CreateCard();
        } else {
          print('error');
        }
      });
    }
  }

  void showAddGoal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: MediaQuery.of(ctx).size.height * 1.0,
          child: Add_Goal(token: widget.token),
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FriendsSection(token: widget.token)));
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
                            value: (data[0]['progress_amount']) / 100,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0, top: 25.0),
                          child: Text(
                            "${((data[0]['progress_amount']).toStringAsFixed(0))}%",
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
                                Rewards(token: widget.token)));
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
        ),
      ),
    );
  }
}
