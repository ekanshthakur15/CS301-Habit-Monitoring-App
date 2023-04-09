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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(name: items[index]),
                    ),
                  );
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
class DetailScreen extends StatelessWidget {
  final String name;

  DetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
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
                      '$name',
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
                        '24',


                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),

                      child: Icon(Icons.people_alt_outlined, color: Colors.black, size:40),

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10, left: 20),
                      child: Text(
                        '8',


                        style: TextStyle(color: Colors.black, fontSize: 28),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),

                      child: Icon(Icons.emoji_events_outlined, color: Colors.black, size:40),

                    ),


                    SizedBox(width: 10),
                    Container(
                      constraints: BoxConstraints.tightFor(
                          width: 70, height: 40),
                      padding: EdgeInsets.all(4),

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
