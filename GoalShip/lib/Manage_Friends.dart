import 'package:flutter/material.dart';

class Manage_Friends extends StatefulWidget {
  @override
  State<Manage_Friends> createState() => _Manage_FriendsState();
}

class _Manage_FriendsState extends State<Manage_Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {},
              child: Container(
                child: Text("Add Friend"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
