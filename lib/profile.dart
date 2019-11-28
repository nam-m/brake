import 'package:flutter/material.dart';
import 'latest_session.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // This widget is the root of your application.
  TextStyle style = TextStyle(fontFamily: 'Open Sans');
  final account_items = ['Account Information', 'Change Username or Password'];
  final personal_items = ['Latest Session', 'Focus Time', 'Session History', 'Set Goals', 'Achievements'];
  final profile_items = ['Latest Session', 'Focus Time', 'Session History', 'Set Goals', 'Achievements']; // move Latest Session separately
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: new Container(
        child: ListView.builder(
          itemCount: profile_items.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(profile_items[index]),
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => LatestSessionPage(),
                      )
                    );
                  },
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}