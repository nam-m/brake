import 'package:flutter/material.dart';
import 'dashboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);

    @override
    Widget build(BuildContext context) {

      final emailField = TextField(
        obscureText: false,
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Username",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
      final passwordField = TextField(
        obscureText: true, // hide input as typing 
        style: style,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      );
      final loginButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => DashboardPage(),
                )
              );
            },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );
      final signupButton = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.grey[350],
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {},
          child: Text("No Account? Sign Up",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.black45, fontWeight: FontWeight.bold)),
        ),
      );
      
      return Scaffold(
        resizeToAvoidBottomPadding: false, // added to avoid overflow
        body: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // horizontal
                mainAxisAlignment: MainAxisAlignment.center, //vertical
                children: <Widget>[
                  SizedBox(
                    height: 150.0,
                    child: Image.asset(
                      "assets/brake_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  emailField,
                  SizedBox(height: 20.0),
                  passwordField,
                  SizedBox(height: 35.0,),
                  loginButton,
                  SizedBox(height: 30.0,),
                  Text("Forgot Password?",
                  textAlign: TextAlign.left,
                  style: style.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 30), //add space between "Forgot Password" and "signupButton"
                  signupButton,
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
