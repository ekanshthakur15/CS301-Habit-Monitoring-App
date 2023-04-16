import 'package:flutter/material.dart';
import 'package:goalship/friends.dart';

class FriendsSearch extends StatefulWidget {
  @override
  State<FriendsSearch> createState() => _FriendsSearchState();
}

class _FriendsSearchState extends State<FriendsSearch> {
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
        title: Text("Search Friend"),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => FriendsSection()));
          },
          icon: Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
        ),
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
                  borderRadius:
                      BorderRadius.circular(15), // Added rounded corners
                ),
                child: Container(
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: 8.0), // Added padding to the left
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
                          trailing: CircleAvatar(
                            child: Icon(
                              Icons.add,
                              color: Colors.white, // Set the color to white
                            ),
                            backgroundColor: Colors
                                .black, // Set the background color to black
                          ),
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

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 50.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Search...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.grey[500]!),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50.0);
}
