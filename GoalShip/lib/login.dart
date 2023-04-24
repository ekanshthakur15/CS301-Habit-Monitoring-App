import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:goalship/HomePage.dart';
import 'package:http/http.dart' as http;

import 'signin.dart';

Color fillcol = Color(0xF3F0F0);
bool _obscureText = true;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

class _LoginState extends State<Login> {
  final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  String _errorMessage = '';

  void _submitForm() async {
    try {
      final token = await _fetchToken(_username.text, _password.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(token: token)),
      );
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to login. Please try again.';
      });
    }
  }

  Future<String> _fetchToken(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8000/users/login/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final token = jsonResponse['token'];
      return token;
    } else {
      throw Exception('Failed to retrieve token');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                'Enter Details',
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.0, top: 50.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20.0, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(width: 1)),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white30,
                  hintText: "Name",
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 20),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                ),
                controller: _username,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 2.0),
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 20.0, top: 40, right: 20, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.0),
                  border: Border.all(width: 0.5)),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white30,
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.black26,
                    fontSize: 20,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                  ),
                ),
                controller: _password,
                obscureText: _obscureText,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 210, bottom: 40),
              child: Text(
                "Forgot the password?",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all(color: Color(0xFF40C5DB), width: 2),
                  borderRadius: BorderRadius.circular(9.0),
                ),
                //LoginButton
                child: TextButton(
                  onPressed: _submitForm,
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFFB5E8F0)),

                    // add this line
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New here?",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18.0, color: Color(0xFFFBFDFF)),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
