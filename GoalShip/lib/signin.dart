import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

TextEditingController name = TextEditingController();
TextEditingController emailId = TextEditingController();
TextEditingController age = TextEditingController();
TextEditingController DoB = TextEditingController();
TextEditingController password = TextEditingController();
List<String> _list = ['Select Gender', 'Male', 'Female'];
String _selectedItem = _list[0];
String Name = '';
String Password = '';

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpg'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover),
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
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: emailId,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all()),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white30,
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Container(
                          margin: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: TextFormField(
                            controller: age,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white30,
                              hintText: "Age",
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 20),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                            ),
                          ),
                        ),
                      ),
                    ), // Age
                    Expanded(
                      child: Container(
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
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.92,
                      height: 55.0,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        border: Border.all(color: Color(0xFF40C5DB), width: 2),
                        borderRadius: BorderRadius.circular(9.0),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFFB5E8F0)),

                          // add this line
                        ),
                        onPressed: () {
                          setState(() {
                            Name = name.text;
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(token: "token")));
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
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
