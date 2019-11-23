import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class MenuPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var menu_one_uri = new AssetImage('assets/headset.png');
    var menu_one_image = new Image(image: menu_one_uri, height: 140.0);
    
    var menu_two_uri = new AssetImage('assets/record.png');
    var menu_two_image = new Image(image: menu_two_uri, height: 140.0);

    var menu_three_uri = new AssetImage('assets/profile_pic.jpg');
    var menu_three_image = new Image(image: menu_three_uri, height: 140.0);

    var menu_four_uri = new AssetImage('assets/settings.png');
    var menu_four_image = new Image(image: menu_four_uri, height: 140.0);

    return MaterialApp(
      home: new Container(
        color: Colors.white,
        child: new Column(
          children: <Widget>[
            new Row(children: <Widget>[
              
              new Expanded(
                flex: 1,
                child: new Column(
                  children: <Widget>[
                    menu_one_image,
                    new Text(
                      "Connect",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )
                    ),
                  ],
                )
              ),

              new Expanded(
                flex: 1,
                child: new Column(
                  children: <Widget>[
                    menu_two_image,
                    new Text(
                      "Record",
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    )
                  ],
                )
              ),

            ],)
          ],
        ),
        )
      );
  }
}