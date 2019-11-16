import 'package:flutter/material.dart';
import 'package:frontend/tabs/tabsmain.dart';

class Left extends StatefulWidget{
  LeftState createState() => LeftState();
}

class LeftState extends State<Left> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            color: Colors.pinkAccent,
            child: Container(
              // padding: EdgeInsets.only(left: 30.0),
              constraints: BoxConstraints.expand(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tasks', style: TextStyle(fontSize: 60.0),),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75))
              ),
              height: 190,
            )),
          Container(
            height: 190,
            color: Colors.purpleAccent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75))
              ),
              height: 190,
            )),
            Container(
            height: 190,
            color: Colors.black54,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75))
              ),
              height: 190,
            )),
            Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75))
              ),
              height: 190,
            ),

        ],
      )
      
    );
  }
}