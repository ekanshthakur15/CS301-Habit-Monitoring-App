import 'package:flutter/material.dart';

import 'Add_Goal.dart';

class GoalCard extends StatelessWidget {
  GoalCard({required this.GoalName, required this.GoalIconId});

  String GoalName;
  int GoalIconId;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        child: Column(
          children: [
            Image.asset(GoalIcons.elementAt(GoalIconId)),
            Text(
              GoalName,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

/*
FutureBuilder<Card_Goal>(
  future: futureGoal,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text(snapshot.data!.name);
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }

    return const CircularProgressIndicator();
  },
)
 */

/*
Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0),
          borderRadius: BorderRadius.circular(35.0),
        ),
        elevation: 5.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.task_alt_rounded,
                color: Colors.black,
                size: 30.0,
              ),
              Text(
                goalName,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
 */
