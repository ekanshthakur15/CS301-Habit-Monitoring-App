import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = [    'Jacob',    'Ekansh',    'Pratik',    'Sam',    'Sarah',    'Item 1',    'Item 2',    'Item 3',    'Item 4',    'Item 5',  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List View Demo',
      home: Scaffold(
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
              return Padding(
                padding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
                            Icons.emoji_events,
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
      ),
    );
  }
}