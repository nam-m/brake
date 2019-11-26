import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'animation.dart';
import 'dart:async';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Wed, November 27th, 2019'),
      ),
      body: new Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 300.0),
            Text(
              elapsedTime, 
              textAlign: TextAlign.center,
              style: style.copyWith(
              color: Colors.black,
              fontSize: 30, 
              fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                    heroTag: "btn1",
                    backgroundColor: Colors.red,
                    onPressed: () => startOrStop(),
                    child: Icon(Icons.pause)),
                SizedBox(width: 20.0),
                FloatingActionButton(
                    heroTag: "btn2",
                    backgroundColor: Colors.green,
                    onPressed: null, //resetWatch,
                    child: Icon(Icons.play_arrow)),
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

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$hoursStr:$minutesStr:$secondsStr";
  }
}