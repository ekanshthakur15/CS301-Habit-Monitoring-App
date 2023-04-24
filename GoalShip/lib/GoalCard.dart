import 'package:flutter/material.dart';
import 'GoalDetails.dart';
import 'Add_Goal.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GoalCard extends StatelessWidget {
  final String token;
  GoalCard(
      {required this.GoalName,
      required this.GoalIconId,
      required this.token,
      required this.id,
      required this.totalProgress});

  String GoalName;
  int GoalIconId;
  int id;
  double totalProgress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            backgroundColor: Color.fromRGBO(237, 237, 237, 1),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GoalDetails(token: token, id: id),
              ),
            );
          },
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset(
                      GoalIcons.elementAt(GoalIconId),
                      height: 150.0,
                      width: 150.0,
                    )),
                    Text(
                      "${((totalProgress).toStringAsFixed(0))}%",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Text(
                GoalName,
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
