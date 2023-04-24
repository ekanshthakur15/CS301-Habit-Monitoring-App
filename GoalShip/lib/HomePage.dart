import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:inline_calendar/inline_calendar.dart';
import 'package:intl/intl.dart';

import 'Add_Goal.dart';
import 'Personal.dart';
import 'Rewards.dart';
import 'Settings.dart';

Color themeColour = Color(0xA63DC5DB);
Color themeBackGrnd = Colors.white;

Color themeColour3 = Color(0x3A5E1EF);

class HomePage extends StatefulWidget {
  final String token;
  const HomePage({required this.token});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CalendarCubit _controller;

  // For bottom drawer use modalBottomSheet

  List data = [];
  late String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  void initState() {
    _controller = CalendarCubit();
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Your API fetching logic goes here
    // Example: Fetching data from a REST API

    var token1 = widget.token;
    var response = await http.get(Uri.parse('http://10.0.2.2:8000/home/$date/'),
        headers: {'Authorization': 'Token $token1'});
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
      });
    } else {
      // Handle error
    }
  }

  // For bottom drawer use modalBottomSheet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(164, 225, 239, 1.0),
        title: Text(
          "Welcome",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        bottom: InlineCalendar(
            controller: _controller,
            onChange: (DateTime d) {
              String dateString = DateFormat('yyyy-MM-dd').format(d);
              setState(() {
                date = dateString;
                fetchData();
              });
            }),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Padding(
                padding: EdgeInsets.only(left: 18.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data[index]["name"],
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: data[index]['goals'].length,
                        itemBuilder: (BuildContext context, int i) {
                          return Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 0),
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9.0),
                                      color: Colors.grey.shade200,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.15),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.88,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            value: data[index]['goals'][i]
                                                ['goal_progress'],
                                            strokeWidth: 10,
                                            valueColor: AlwaysStoppedAnimation(
                                                themeColour2),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 18.0),
                                            child: Text(
                                              data[index]['goals'][i]
                                                  ['goal_name'],
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          }),
      bottomNavigationBar: BottomAppBar(
          color: Color(0xFFEDEDED),
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
                    showAddGoal(context, widget.token);
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

  @override
  void dispose() {
    print('dispose');
    _controller.close();
    super.dispose();
  }
}

void showAddGoal(BuildContext ctx, String token) {
  showModalBottomSheet(
    context: ctx,
    builder: (_) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: MediaQuery.of(ctx).size.height * 1.0,
        child: Add_Goal(token: token),
      );
    },
    useSafeArea: true,
    isScrollControlled: true,
    // shape: CircleBorder(),
  );
}
