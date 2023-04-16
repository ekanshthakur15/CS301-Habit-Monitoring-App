import 'package:flutter/material.dart';

class GoalCard extends StatelessWidget {
  GoalCard(this.goalName);
  final String goalName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
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
    );
  }
}
