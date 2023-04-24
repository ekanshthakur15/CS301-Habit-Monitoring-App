import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DetailScreen extends StatefulWidget {
  final int id;
  final String token;

  DetailScreen({required this.id, required this.token});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List items = [];
  void initState() {
    super.initState();
    getDetail();
  }

  Future<void> getDetail() async {
    late int friend_id = widget.id;
    var token1 = widget.token;
    var response = await http.get(
        Uri.parse(
          'http://127.0.0.1:8000/friend_detail/$friend_id/',
        ),
        headers: {'Authorization': 'Token $token1'});
    if (response.statusCode == 200) {
      setState(() {
        items = jsonDecode(response.body);
      });
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, index) {
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 19, right: 50, left: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 95,
                        child: Icon(Icons.person, size: 120),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          items[index]['name'],
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Card(
                    color: Color(0xFFBBE4E9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(
                            '2',
                            style: TextStyle(color: Colors.black, fontSize: 28),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Icon(Icons.people_alt_outlined,
                              color: Colors.black, size: 40),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 20),
                          child: Text(
                            '4',
                            style: TextStyle(color: Colors.black, fontSize: 28),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.emoji_events_outlined,
                              color: Colors.black, size: 40),
                        ),
                        SizedBox(width: 10),
                        Container(
                          constraints:
                              BoxConstraints.tightFor(width: 70, height: 40),
                          padding: EdgeInsets.all(4),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
