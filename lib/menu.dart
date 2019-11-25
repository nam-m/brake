import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  // This widget is the root of your application.
  TextStyle style = TextStyle(fontFamily: 'Open Sans');

  @override
  Widget build(BuildContext context) {

    var menu_one_uri = new AssetImage('assets/headset.png');
    var menu_one_image = new Image(image: menu_one_uri, height: 70.0);
    
    var menu_two_uri = new AssetImage('assets/record.png');
    var menu_two_image = new Image(image: menu_two_uri, height: 70.0);

    var menu_three_uri = new AssetImage('assets/profile_pic.jpg');
    // var menu_three_image = new CircleAvatar(backgroundImage: menu_three_uri, minRadius: 5.0, maxRadius: 100);
    var menu_three_image = new Image(image: menu_three_uri, height: 70.0);


    var menu_four_uri = new AssetImage('assets/settings.png');
    var menu_four_image = new Image(image: menu_four_uri, height: 70.0);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Connect", menu_one_image),
            makeDashboardItem("Focus", menu_two_image),
            makeDashboardItem("Profile", menu_three_image),
            makeDashboardItem("Settings", menu_four_image),
          ],
        ),
      ),
    );
  }
  Card makeDashboardItem(String title, var image) {
    return Card(
        elevation: 3.0,
        margin: new EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: new InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 25.0),
                image,
                SizedBox(height: 20.0),
                new Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                      color: Colors.black,
                      fontSize: 18, 
                      fontWeight: FontWeight.bold)
                   ),
                )
              ],
            ),
          ),
        ));
  }
}