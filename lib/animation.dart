import 'dart:math';
import 'dart:ui' as ui;
import 'package:vector_math/vector_math.dart' as Vector;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class AnimationWave extends StatefulWidget {
  @override
  _AnimationWaveState createState() => new _AnimationWaveState();
  AnimationWave() {
    timeDilation = 1.0;
  }
}

class _AnimationWaveState extends State<AnimationWave> {
  @override
  Widget build(BuildContext context) {
    Size size = new Size(
      MediaQuery.of(context).size.width, 300.0);
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Wed, November 27th, 2019',
          textAlign: TextAlign.center,
          ),
      ),
      backgroundColor: Colors.white,
      body: new Stack(
        children: <Widget>[
          new ColorCurveBody(size: size, xOffset: 50, yOffset: 0, color: Colors.blue),
          new ColorCurveBody(size: size, xOffset: 50, yOffset: 8, color: Colors.white),
        ],
      ),
    );
  }
}

class ColorCurveBody extends StatefulWidget {
  final Size size;
  final int xOffset;
  final int yOffset;
  final Color color;

  ColorCurveBody(
      {Key key, @required this.size, this.xOffset, this.yOffset, this.color})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _ColorCurveBodyState();
  }
}

class _ColorCurveBodyState extends State<ColorCurveBody>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<Offset> animList1 = [];

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        duration: new Duration(
          seconds: 2
        )
    );
    animationController.addListener(() {
      animList1.clear();
      for (int i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        animList1.add(new Offset(
            i.toDouble() + widget.xOffset,
            // pow(sin(animationController.value * 360 - i),91) + pow(sin(i+4),120) + widget.yOffset));
            sin((animationController.value * 360 - i) 
            % 360 * Vector.degrees2Radians) * 20 
            + 50 + widget.yOffset));
      }
    });
    animationController.repeat();
  }
  
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: new CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => new ClipPath(
              child: widget.color == null
                  ? Image.network(
                      '',
                      width: widget.size.width,
                      height: widget.size.height,
                      fit: BoxFit.cover,
                    )
                  : new Container(
                      width: widget.size.width,
                      height: widget.size.height,
                      color: widget.color,
                    ),
              clipper: new WaveClipper(animationController.value, animList1),
            ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double animation;

  List<Offset> waveList1 = [];

  WaveClipper(this.animation, this.waveList1);

  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.addPolygon(waveList1, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}