import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // This widget is the root of your application.
  TextStyle style = TextStyle(fontFamily: 'Open Sans');

  final security_items = ['Privacy', 'Services', 'Data Storage'];
  final eeg_items = ['Calibration'];
  final notification_items = ['Set Reminders', 'Email Preferences'];
  final system_items = ['Your Brake Device', 'Region', 'Language'];

  final settings_items = ['Account Information', 'Change Username or Password', 'Notifications', 'Calibration', 'Your Brake Device', 'Privacy', 'Services', 'Data Storage', ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold( 
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: new Container(
        child: ListView.builder(
          itemCount: settings_items.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(settings_items[index]),
                  onTap: () {},
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