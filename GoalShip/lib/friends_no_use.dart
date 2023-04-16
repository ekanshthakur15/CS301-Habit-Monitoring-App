import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Friends extends StatefulWidget {
  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  final List<String> items = [
    'Jacob',
    'Ekansh',
    'Pratik',
    'Sam',
    'Sarah',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xA63DC5DB),
        title: Text("Friends"),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
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
                          title: Text(items[index]),
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
            );
          },
        ),
      ),
    );
  }
}
