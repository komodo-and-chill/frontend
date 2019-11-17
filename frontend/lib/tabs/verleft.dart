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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(child: Text('Nomair: ', style: TextStyle(fontSize: 30.0),),
                                      margin: EdgeInsets.only(bottom: 75.0, left:30),
                                      height: 75.0,
                                      width: 300,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(child: Text('You: ', style: TextStyle(fontSize: 30.0)),
                                      margin: EdgeInsets.only(bottom: 100, left: 30),
                                    ),

                                  ],
                                )
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