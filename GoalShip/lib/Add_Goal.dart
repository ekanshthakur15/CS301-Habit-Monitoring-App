import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goalship/goals.dart';

import 'GoalCard.dart';

class Add_Goal extends StatefulWidget {
  @override
  _Add_GoalState createState() => _Add_GoalState();
}

String Hobby_name = "";
int no_of_dates = 0;
String freq = '';
TextEditingController goalName = TextEditingController();
TextEditingController goalDuration = TextEditingController();
bool switch_state = false;
MaterialStateColor buttonColor =
    MaterialStateColor.resolveWith((states) => Color(0xA63DC5DB));
Color buttonColor2 = Color(0xA63DC5DB);

class _Add_GoalState extends State<Add_Goal> {
  void onChanged(bool val) {
    setState(() {
      switch_state = !val;
    });
  }

  List<String> parameters = [
    'Select Unit',
    'Hr',
    'min',
    'sec',
    'm',
    'km',
    'g',
    'kg'
  ];
  String _selectedItem = 'Select Unit';

  int amount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 15.0,
              ),
              Text(
                'Create new Goal',
                style: TextStyle(color: Colors.black),
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: goalName,
                    decoration: InputDecoration(
                      hintText: "Hobby Name",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Choose the Duration",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: goalDuration,
                    decoration: InputDecoration(
                      hintText: "Number of days",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.0),
                  child: Text(
                    "Choose frequency",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child: Reusable_card('Daily')),
                    Expanded(child: Reusable_card('Weekly')),
                    Expanded(child: Reusable_card('Monthly')),
                  ],
                ),
                Center(
                  child: Text(
                    "On these dates",
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Reusable_card_Day('Mon'),
                      Reusable_card_Day('Tue'),
                      Reusable_card_Day('Wed'),
                      Reusable_card_Day('Thu'),
                      Reusable_card_Day('Fri'),
                      Reusable_card_Day('Sat'),
                      Reusable_card_Day('Sun'),
                    ],
                  ),
                ),
                Container(
                  height: 40.0,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: buttonColor2,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        buttonColor2 = MaterialStateColor.resolveWith(
                            (states) => Color(0xA645DE96));
                      });
                    },
                    child: Center(
                        child: Text(
                      "Everyday",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Notification",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notifications"),
                      CupertinoSwitch(
                          value: switch_state,
                          onChanged: (value) => onChanged(switch_state)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Row(
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
                      width: 80.0,
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
                    padding: EdgeInsets.only(top: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0xA63DC5DB),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            Hobby_name = goalName.text;
                            UserHobbyList.add(
                              GoalCard(Hobby_name),
                            );
                            Navigator.pop(context);
                            Hobby_name = '';
                            buttonColor = MaterialStateColor.resolveWith(
                                (states) => Color(0xA63DC5DB));
                            buttonColor2 = Color(0xA63DC5DB);
                          });
                        },
                        child: Text(
                          "Confirm",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Reusable_card extends StatefulWidget {
  Reusable_card(this.duration);

  final String duration;

  @override
  State<Reusable_card> createState() => _Reusable_cardState();
}

class _Reusable_cardState extends State<Reusable_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: 50.0,
      width: 70.0,
      child: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: buttonColor,
          ),
          onPressed: () {
            setState(() {
              buttonColor =
                  MaterialStateColor.resolveWith((states) => Color(0xA645DE96));
              freq = widget.duration;
            });
          },
          child: Text(
            widget.duration,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class Reusable_card_Day extends StatefulWidget {
  Reusable_card_Day(this.duration);

  final String duration;

  @override
  State<Reusable_card_Day> createState() => _Reusable_card_DayState();
}

class _Reusable_card_DayState extends State<Reusable_card_Day> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
      ),
      height: 50.0,
      width: 70.0,
      child: Center(
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: buttonColor,
          ),
          onPressed: () {
            setState(() {
              buttonColor =
                  MaterialStateColor.resolveWith((states) => Color(0xA645DE96));
              freq = widget.duration;
            });
          },
          child: Text(
            widget.duration,
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

/*
Row(
                children: [
                  Container(
                    child: Row(
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
                    height: 50.0,
                    child: DropDownMenu(
                      title: 'Gender',
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
 */
