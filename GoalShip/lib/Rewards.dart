import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:goalship/rewardsDetails.dart';

import 'HomePage.dart';
import 'Personal.dart';
import 'Settings.dart';

/*
Array of goals icons
Array of rewards
total completion goal icon is fixed

 */

class Rewards extends StatefulWidget {
  final String token;
  const Rewards({required this.token});
  @override
  State<Rewards> createState() => _RewardsState();
}

List<String> RewardsList = [
  'assets/reward1.png',
  'assets/reward2.png',
  'assets/reward3.png',
  'assets/reward4.png',
  'assets/reward5.png',
  'assets/reward6.png',
  'assets/reward7.png',
  'assets/reward8.png',
  'assets/reward9.png',
];

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    List<Widget> RewardsListCards = [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(0),
                  ),
                ),
              );
            },
            child: Image.asset(
              RewardsList.elementAt(0),
            )),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(1),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(1))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(2),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(2))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(3),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(3))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(4),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(4))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(5),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(5))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(6),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(6))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(0),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(7))),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RewardDetails(
                    token: widget.token,
                    image: RewardsList.elementAt(0),
                  ),
                ),
              );
            },
            child: Image.asset(RewardsList.elementAt(8))),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xA63DC5DB),
        elevation: 0.0,
        title: Text(
          "Rewards",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: RewardsListCards,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //1
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HomePage(token: widget.token)));
                  });
                },
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30.0,
                )),
            //2
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Rewards(token: widget.token)));
                  });
                },
                child: FaIcon(
                  Icons.emoji_events_rounded,
                  color: Colors.black,
                  size: 28.0,
                )),
            //3
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: GestureDetector(
                onTap: () {
                  showAddGoal(context, "");
                },
                child: CircleAvatar(
                  backgroundColor: themeColour,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 35.0,
                  ),
                ),
              ),
            ),
            //4
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(token: widget.token)));
                  });
                },
                child: FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.black,
                  size: 24.0,
                )),
            //5
            GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Settings_Page(token: widget.token)));
                  });
                },
                child: FaIcon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30.0,
                )),
          ],
        ),
      ),
    );
  }
}
