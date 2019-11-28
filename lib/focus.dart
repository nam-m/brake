import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dashboard.dart';
// import 'animation.dart';

class FocusPage extends StatefulWidget {
  @override
  _FocusPageState createState() => _FocusPageState();
}

class _FocusPageState extends State<FocusPage> {
  // This widget is the root of your application.
  TextStyle style = TextStyle(fontFamily: 'Open Sans');
  
  Stopwatch watch = Stopwatch();
  Timer timer;
  bool startStop = true;

  String elapsedTime = '';

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('kk:mm:ss \nEEE d MMM').format(now);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Wed, November 27th, 2019'),
      ),
      body: new Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            // MaterialApp(
            //   title: 'Wave',
            //   theme: ThemeData(
            //     primarySwatch: Colors.blue,
            //   ),
            //   home: AnimationWave()
            // ),
            SizedBox(height: 200.0),
            Text(
              elapsedTime, 
              textAlign: TextAlign.center,
              style: style.copyWith(
              color: Colors.black,
              fontSize: 30, 
              fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 70.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.green,
                    onPressed: () => startWatch(),
                    child: Icon(Icons.play_arrow)),
                SizedBox(width: 20.0),
                FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.red,
                    onPressed: () => _buildAboutDialog(context), 
                    child: Icon(Icons.stop)),
              ],
            )
          ],
        ),
      ),
    );
    // return MaterialApp(
      // title: 'Wave',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: AnimationWave()
    // );
  }
   startOrStop() {
    if(startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      watch.stop();
      setTime();
    });
  }
  
  Widget _buildAboutDialog(BuildContext context) {
    stopWatch();
    var cancelButton = FlatButton(
      child: Text(
        "Cancel",
        style: style.copyWith(
          color: Colors.grey,
          fontSize: 18, 
          fontWeight: FontWeight.bold),
        ),
      onPressed: () {
        Navigator.pop(context);

        //reset timer
        
      } 
    );
    var continueButton = FlatButton(
      child: Text(
        "Accept",
        style: style.copyWith(
          color: Colors.blue,
          fontSize: 18, 
          fontWeight: FontWeight.bold),
        ),
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DashboardPage(),
          )
        );
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Session Stopped",
        style: style.copyWith(
          color: Colors.black,
          fontSize: 20, 
          fontWeight: FontWeight.bold),
        ),
      content: Text("EEG signal has been recorded. \nWould you like to save?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60 ).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}