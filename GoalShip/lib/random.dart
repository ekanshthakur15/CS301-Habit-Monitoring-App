import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalship/Personal.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Add_Goal.dart';
import 'HomePage.dart';

bool _editable = false;

class GoalDetails extends StatefulWidget {
  int id;
  final String token;
  GoalDetails({Key? key, required this.token, required this.id});

  @override
  State<GoalDetails> createState() => _GoalDetailsState();
}

int completion = 0;
TextEditingController _completion = TextEditingController();

class _GoalDetailsState extends State<GoalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    child: CircularProgressIndicator(
                      value: 0.60,
                      valueColor: AlwaysStoppedAnimation(
                        themeColour,
                      ),
                      strokeWidth: 25.0,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 68.0, top: 50.0),
                    child: Text(
                      "Goal",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0, bottom: 50.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PersonalPage(token: widget.token)));
                        setState(() {
                          buttonColor = MaterialStateColor.resolveWith(
                              (states) => Color(0xA63DC5DB));
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Divider(
                color: Colors.black,
                thickness: 1.0,
                height: 50.0,
              ),
            ),
            Container(
              height: 60.0,
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Container(
                    width: 150.0,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: TextFormField(
                          controller: _completion,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _editable = !_editable;
                                  });
                                },
                                icon: Icon(
                                  _editable
                                      ? CupertinoIcons.pencil_slash
                                      : CupertinoIcons.pencil,
                                ),
                              )),
                          enabled: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    child: VerticalDivider(
                      width: 80.0,
                      thickness: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Hr",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  height: 420.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: themeColour.withOpacity(0.4), width: 5.0),
                    borderRadius: BorderRadius.circular(20.0),
                    // color: themeColour.withOpacity(0.4),
                  ),
                  child: TableCalendar(
                    headerStyle: HeaderStyle(
                      titleTextStyle:
                          TextStyle(fontFamily: 'montserrat', fontSize: 17.0),
                      headerPadding: EdgeInsets.all(15.0),
                      headerMargin: EdgeInsets.only(bottom: 13.0),
                      decoration: BoxDecoration(
                          color: themeColour.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          )),
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                    ),
                    availableCalendarFormats: {CalendarFormat.month: 'month'},
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(color: Colors.blue),
                    ),
                    firstDay: DateTime.utc(2023, 1, 1),
                    focusedDay: DateTime.now(),
                    lastDay: DateTime.utc(2023, 12, 31),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: themeColour.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10.00)),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 140.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.linear_scale_outlined)],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45.0,
                            ),
                            Column(
                              children: [Text("Total Duration"), Text(" days")],
                            ),
                            SizedBox(
                              height: 60.0,
                              child: VerticalDivider(
                                width: 80.0,
                                thickness: 1.0,
                                color: Colors.black,
                              ),
                            ),
                            Column(
                              children: [
                                Text("Completed"),
                                Text("days"),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 10.0,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: Divider(
                                color: Colors.black,
                                thickness: 1.0,
                                height: 50.0,
                              ),
                            ),
                            Icon(
                              Icons.circle,
                              size: 10.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
