import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inline_calendar/inline_calendar.dart';
import 'Calender.dart';
import 'Settings.dart';
import 'Friends.dart';
import 'Add_Goal.dart';

Color themeColour = Color(0xA63DC5DB);
Color themeBackGrnd = Colors.white;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CalendarCubit _controller;

  // For bottom drawer use modalBottomSheet
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
        backgroundColor: Color(0xA63DC5DB),
        title: Text("GoalShip"),
        bottom: InlineCalendar(
          controller: _controller,
          onChange: (DateTime d) => print(d),
        ),
      ),
      body: Container(
        color: themeBackGrnd,
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
                    FontAwesomeIcons.calendar,
                    color: Colors.black,
                    size: 20.0,
                  )),
              //3
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
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
                    FontAwesomeIcons.userGroup,
                    color: Colors.black,
                    size: 20.0,
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

  @override
  void initState() {
    _controller = CalendarCubit();
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    _controller.close();
    super.dispose();
  }
}
