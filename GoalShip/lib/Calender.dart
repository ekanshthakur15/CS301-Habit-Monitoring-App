import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Add_Goal.dart';
import 'HomePage.dart';
import 'Settings.dart';
import 'goals.dart';

class Calender_Page extends StatefulWidget {
  @override
  State<Calender_Page> createState() => _CalenderState();
}

class _CalenderState extends State<Calender_Page> {
  int completedTask = 0;
  int days_missed = 0;

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
      backgroundColor: themeBackGrnd,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: themeColour,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Daily Record",
                style: TextStyle(
                    color: TextColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
              GestureDetector(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.user,
                  color: TextColour,
                ),
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              height: 430.0,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white70),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(color: Colors.blue),
                      selectedDecoration: BoxDecoration(color: Colors.amber)),
                  firstDay: DateTime.utc(2023, 1, 1),
                  focusedDay: DateTime.utc(2023, 1, 1),
                  lastDay: DateTime.utc(2023, 12, 31),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Your Progress",
                style: TextStyle(
                    color: TextColour,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
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
