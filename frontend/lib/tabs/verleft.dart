import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class VLeft extends StatefulWidget {
  VLeftState createState() => VLeftState();
}

class VLeftState extends State<VLeft> {
  double _height = 0;
  double _height2 = 0;
  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();
  Mode _mode = Mode.overlay;

  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.pink[800],
            Colors.pink[500],
            Colors.pink[300],
            Colors.purple[100],
          ],
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent ,
        key: homeScaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 50.0)],
                      color: Colors.white60,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        width: 2.0, color: Colors.black12
                      )
                    ),
                    height: 400,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                AnimatedContainer(
                                  duration: Duration(seconds: 4),
                                  width: 60.0,
                                  height: _height2,
                                  color: Colors.lightGreenAccent,
                                ),
                                AnimatedContainer(
                                  duration: Duration(seconds: 4),
                                  width: 60.0,
                                  height: _height,
                                  color: Colors.lightGreenAccent,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget> [
                                SizedBox(
                                  child: Text('Nomair', style: TextStyle(fontSize: 30.0))
                                  ),
                                SizedBox(
                                  child: Text('You', style: TextStyle(fontSize: 30.0))),
                              ],
                            ),
                            RaisedButton(
                              child: Text('Get Scores'),
                              onPressed: () {
                                setState(() {
                                  _height = 300;
                                  _height2 = 250;
                                });
                              })
                      ],
                    ),
                  ),
                      ],
                  ),
          ],
                  ),
        )
    );
  }
}