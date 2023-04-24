import 'dart:convert';

import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalship/HomePage.dart';
import 'package:http/http.dart' as http;

class Add_Goal extends StatefulWidget {
  final String token;
  Add_Goal({required this.token});
  @override
  _Add_GoalState createState() => _Add_GoalState();
}

List<String> GoalIcons = [
  'assets/Cross_country_race.png',
  'assets/Early_morning_amico.png',
  'assets/Meditation.png',
  'assets/Studying.png',
  'assets/Workout.png',
  'assets/Business.png'
];

String Hobby_name = "";

int amount = 1;

bool _hasbeenSelected0 = false;
bool _hasbeenSelected1 = false;
bool _hasbeenSelected2 = false;
bool _hasbeenSelected3 = false;
bool _hasbeenSelected4 = false;
bool _hasbeenSelected5 = false;

final goalName = TextEditingController();
final goalDuration = TextEditingController();

bool switch_state = false;

MaterialStateColor buttonColor =
    MaterialStateColor.resolveWith((states) => Color(0xA63DC5DB));

Color buttonColor2 = Color(0xA63DC5DB);

int imageLocation = 0;

class _Add_GoalState extends State<Add_Goal> {
  void onChanged(bool val) {
    setState(() {
      switch_state = !val;
    });
  }

  List<String> parameters = [
    'Select Unit',
    'Hr',
    'minutes',
    'sec',
    'm',
    'km',
    'g',
    'kg'
  ];
  String _selectedItem = 'Select Unit';

  // Function to make API request
  final apiUrl = Uri.parse('http://10.0.2.2:8000/create_goal/');

  Future<void> createGoal(String name, int duration, int icon, int progress,
      String progressType) async {
    var token1 = widget.token;

    try {
      final response = await http.post(
        apiUrl,
        headers: {
          'Authorization': 'Token $token1',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'duration': duration,
          'image': icon,
          'progress': progress,
          'progress_type': progressType,
        }),
      );
      print(response.body);

      if (response.statusCode == 201) {
        print('Goal created successfully');
      } else {
        print('Failed to create goal. Error code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred while creating goal: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> GoalIconCards = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected0 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected0 = !_hasbeenSelected0;
              imageLocation = 0;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(0),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected1 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected1 = !_hasbeenSelected1;
              imageLocation = 1;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(1),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected2 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected2 = !_hasbeenSelected2;
              imageLocation = 2;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(2),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected3 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected3 = !_hasbeenSelected3;
              imageLocation = 3;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(3),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected4 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected4 = !_hasbeenSelected4;
              imageLocation = 4;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(4),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor:
                _hasbeenSelected5 ? themeColour.withOpacity(0.3) : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _hasbeenSelected5 = !_hasbeenSelected5;
              imageLocation = 5;
            });
          },
          child: Image.asset(
            GoalIcons.elementAt(5),
          ),
        ),
      ),
    ];

    /* Here onwards main code*/

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Create new Goal',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    buttonColor = MaterialStateColor.resolveWith(
                        (states) => Color(0xA63DC5DB));
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          elevation: 0.0,
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Goal Name",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xFF40C5DB)),
                    ),
                    child: TextFormField(
                      controller: goalName,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Goal Name",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Choose the Duration",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xFF40C5DB)),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: goalDuration,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Number of days",
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20),
                    child: Text(
                      "Choose icon",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13.0),
                          border: Border.all(),
                        ),
                        child: GridView.count(
                          crossAxisCount: 3,
                          children: GoalIconCards,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, bottom: 20),
                    child: Text(
                      "Choose Amount",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color(0xFFB5E8F0),
                          border:
                              Border.all(color: Color(0xFF40C5DB), width: 2),
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              icon: Icon(CupertinoIcons.minus),
                              onPressed: () {
                                setState(() {
                                  amount -= 1;
                                  if (amount < 0) amount = 0;
                                });
                              },
                            ),
                            Text('$amount'),
                            IconButton(
                              icon: Icon(CupertinoIcons.plus),
                              onPressed: () {
                                setState(() {
                                  amount += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 150.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF40C5DB)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xFFB5E8F0),
                        ),
                        child: DropDownMenu(
                          enabled: true,
                          values: parameters,
                          value: _selectedItem,
                          onChanged: (value) {
                            setState(() {
                              _selectedItem = value!;
                            });
                          },
                          themeFont: true,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF40C5DB)),
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color(0xCFF5FA),
                        ),
                        child: TextButton(
                          onPressed: () {
                            createGoal(
                                goalName.text,
                                int.parse(goalDuration.text),
                                imageLocation,
                                amount,
                                _selectedItem);
                            setState(() {
                              Hobby_name = goalName.text;
                              _hasbeenSelected0 = false;
                              _hasbeenSelected1 = false;
                              _hasbeenSelected2 = false;
                              _hasbeenSelected3 = false;
                              _hasbeenSelected4 = false;
                              _hasbeenSelected5 = false;
                              Hobby_name = '';
                            });
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xFFA4E1EF)),
                            textStyle: MaterialStateProperty.all(
                                TextStyle(fontSize: 22.0, color: Colors.black)),
                          ),
                          child: Text(
                            'Create',
                            selectionColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
