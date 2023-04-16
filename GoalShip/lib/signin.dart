import 'package:flutter/material.dart';
import 'package:goalship/HomePage.dart';
import 'welcome.dart';
import 'signin.dart';
import 'package:drop_down_list_menu/drop_down_list_menu.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController name = TextEditingController();

class _SignInState extends State<SignIn> {

  TextEditingController emailId = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController DoB = TextEditingController();

  List<String> _list = ['Select Gender', 'Male', 'Female'];
  String _selectedItem = 'Select Gender';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/mountain.jpg"),
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          height: MediaQuery.of(context).size.height * 1.0,
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 25.0, bottom: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            "to",
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "GoalShip",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35.0),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
                  child: Text(
                    "Name",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: name,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
                  child: Text(
                    "Email",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: emailId,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          controller: age,
                          decoration: InputDecoration(
                            label: Text("Age"),
                            hintText: "Age",
                          ),
                        ),
                      ),
                    ), // Age
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all()),
                        child: TextFormField(
                          controller: DoB,
                          decoration: InputDecoration(
                            label: Text("Date of Birth"),
                            hintText: "Date of Birth",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 175.0,
                    child: DropDownMenu(
                      title: 'Gender',
                      enabled: true,
                      values: _list,
                      value: _selectedItem,
                      onChanged: (value) {
                        setState(() {
                          _selectedItem = value!;
                        });
                      },
                      themeFont: true,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
