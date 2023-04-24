import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goalship/HomePage.dart';
import 'package:goalship/friendsearch.dart';
import 'package:http/http.dart' as http;

import 'Friend_Detail.dart';

class FriendsSection extends StatefulWidget {
  final String token;
  const FriendsSection({required this.token});
  @override
  State<FriendsSection> createState() => _FriendsSectionState();
}

class _FriendsSectionState extends State<FriendsSection> {
  List items = [];

  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var token1 = widget.token;
    var response = await http.get(
        Uri.parse("http://10.0.2.2:8000/friend_list/"),
        headers: {'Authorization': 'Token $token1'});
    if (response.statusCode == 200) {
      setState(() {
        items = jsonDecode(response.body);
      });
    } else {
      //catch the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Friends',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(token: widget.token)),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios_new_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Icon(
                Icons.language,
                size: 35,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FriendsSearch()));
              });
              // Add your onPressed action here
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        id: items[index]['id'],
                        token: widget.token,
                      ),
                    ),
                  );
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  color: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: ListTile(
                            title: Text(items[index]['name']),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.emoji_events_outlined,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
