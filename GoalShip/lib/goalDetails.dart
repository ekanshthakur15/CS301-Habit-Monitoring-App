import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:goalship/Personal.dart';
import 'package:http/http.dart' as http;

import 'Add_Goal.dart';
import 'HomePage.dart';

bool _editable = false;

class GoalDetails extends StatefulWidget {
  final int id;
  final String token;
  GoalDetails({Key? key, required this.token, required this.id});

  @override
  State<GoalDetails> createState() => _GoalDetailsState();
}

int completion = 0;
TextEditingController _completion = TextEditingController();

class _GoalDetailsState extends State<GoalDetails> {
  var data = {};
  @override
  void initState() {
    super.initState();
    getDetail();
  }

  Map<DateTime, int> completedDates = {};
  Future<void> getDetail() async {
    var token1 = widget.token;
    int goal_id = widget.id;
    var response = await http.get(
      Uri.parse("http://10.0.2.2:8000/goal_detail/$goal_id/"),
      headers: {'Authorization': 'Token $token1'},
    );
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (var date in jsonData['completed_dates']) {
        completedDates[DateTime.parse(date['completed_date'])] = 9;
      }
      var progress = jsonData['progress'];
      var duration = jsonData['duration'];
      var completed = jsonData['completed'];
      var progressType = jsonData['progress_type'];

      setState(() {
        data = {
          'name': jsonData['name'],
          'progress_percentage': (progress / duration * 100).toDouble(),
          'progress': progress,
          'progress_type': progressType,
          'completed_dates': completedDates,
          'duration': duration,
          'completed': completed,
        };
        print(data);
      });
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 1.2,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    child: CircularProgressIndicator(
                      value: ((data['progress_percentage']) / 1000),
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      valueColor: AlwaysStoppedAnimation(
                        themeColour,
                      ),
                      strokeWidth: 25.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 68.0, top: 60.0),
                    child: Text(
                      data['name'],
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
                    data['progress_type'],
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
                      border: Border.all(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: HeatMapCalendar(
                    defaultColor: Colors.white,
                    flexible: true,
                    colorMode: ColorMode.color,
                    datasets: completedDates,
                    colorsets: const {
                      9: Color.fromRGBO(187, 228, 233, 40),
                    },
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
                            const SizedBox(
                              width: 45.0,
                            ),
                            Column(
                              children: [
                                Text("Total Duration"),
                                Text("${data['duration']} days")
                              ],
                            ),
                            const SizedBox(
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
                                Text("${data['completed']} days")
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
            SizedBox(
              height: 35.0,
            ),
          ],
        ),
      ),
    ));
  }
}
