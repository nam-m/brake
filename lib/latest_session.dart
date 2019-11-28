import 'package:flutter/material.dart';
import 'dashboard.dart';

class LatestSessionPage extends StatefulWidget {
  LatestSessionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LatestSessionPageState createState() => _LatestSessionPageState();
}

class _LatestSessionPageState extends State<LatestSessionPage> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  var plot = new Image(image: new AssetImage("assets/real_time_plot.gif"));

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false, // added to avoid overflow
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // horizontal
              mainAxisAlignment: MainAxisAlignment.start, //vertical
              children: <Widget>[
                plot,
                SizedBox(height: 10.0,),
                _buildCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard() => SizedBox(
    height: 210,
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text('Stats',
              style: style.copyWith(
                    color: Colors.black,
                    fontSize: 18, 
                    fontWeight: FontWeight.bold)
            ),
            // subtitle: Text('My City, CA 99984'),
            leading: Icon(
              Icons.list,
              color: Colors.blue[500],
            ),
          ),
          Divider(),
          ListTile(
            title: Text('High Attention Time: ',
              style: style.copyWith(
                    color: Colors.black,
                    fontSize: 16, 
                    fontWeight: FontWeight.normal)
            ),
            leading: Icon(
              Icons.trending_up,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: Text('Low Attention Time: ',
              style: style.copyWith(
                      color: Colors.black,
                      fontSize: 16, 
                      fontWeight: FontWeight.normal)
            ),
            leading: Icon(
              Icons.trending_down,
              color: Colors.blue[500],
            ),
          ),
        ],
      ),
    ),
  );
}
