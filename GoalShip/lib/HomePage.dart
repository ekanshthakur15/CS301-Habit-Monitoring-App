import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/Rewards.dart';
import 'package:inline_calendar/inline_calendar.dart';

import 'Add_Goal.dart';
import 'Personal.dart';
import 'Settings.dart';

Color themeColour = Color(0xA63DC5DB);
Color themeBackGrnd = Colors.white;

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
    // shape: CircleBorder(),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CalendarCubit _controller;

  // For bottom drawer use modalBottomSheet

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xA63DC5DB),
        elevation: 0.0,
        title: Text(
          "GoalShip",
          style: TextStyle(color: Colors.black),
        ),
        bottom: InlineCalendar(
          controller: _controller,
          onChange: (DateTime d) => print(d),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Ekansh",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: Colors.grey.shade200,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: 0.30,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Goal 1",
                                  style: TextStyle(
                                      fontSize: 20.0,
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
                      Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: Colors.grey.shade200,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: 0.30,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Goal 2",
                                  style: TextStyle(
                                      fontSize: 20.0,
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
                      Container(
                        height: 55.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: Colors.grey.shade200,
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                backgroundColor: Colors.grey,
                                value: 0.30,
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 18.0),
                                child: Text(
                                  "Goal 3",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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

List<Widget> Shared_goals = [];
List<Widget> DailySharedList = [];

/*
format for Shared_goals :

Container(
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9.0),
        color: Colors.grey.shade200,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Padding(
        padding: EdgeInsets.only(left: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              value: 0.30,
              valueColor:
                  AlwaysStoppedAnimation(Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0),
              child: Text(
                <Goal Name>,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
         ],
      ),
   ),
),
 */

/*
format for DailySharedList :
 child: Column(
   crossAxisAlignment: CrossAxisAlignment.start,
   children: [
     Text(
       <Friend Name>,
       style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
     ),
     Container(
        width : MediaQuery.of(context).size.width * 0.85,
        height : 200.0,
        child : GridView.count(
            count : 1,
            children : Shared_goals
        ),
     ),
   ],
)
 */
