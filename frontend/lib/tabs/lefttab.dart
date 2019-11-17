import 'package:flutter/material.dart';
import 'package:frontend/tabs/lefttutils/shower.dart';
import 'lefttutils/shower.dart';
import 'lefttutils/washer.dart';

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
              width: 500,
              height: 190.0,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75)),
              color: Colors.pinkAccent,) ,
              child: FlatButton(
              child: Text('Shower', style: TextStyle(fontSize: 60.0, color: Colors.white70),),
              onPressed: () => _timer(),
            ))),
            Container(
            height: 190,
            color: Colors.black54,
            child: Container(
              width: 500,
              height: 190.0,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75)),
              color: Colors.purpleAccent,) ,
              child: FlatButton(
              child: Text('DishWasher', style: TextStyle(fontSize: 60.0, color: Colors.white70),),
              onPressed: () => _washer(),
            ))),
            Container(
            height: 190,
            color: Colors.blueGrey,
            child: Container(
              width: 500,
              height: 190.0,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75)),
              color: Colors.black54,) ,
              child: FlatButton(
              child: Text('Washer', style: TextStyle(fontSize: 60.0, color: Colors.white70),),
              onPressed: () => _washer(),
            ))),

        ],
      )
      
    );
  }

  void _washer() {
    Navigator.pushNamed(context, '/counter');
  }

  void _timer() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CountDownTimer())
    );
  }
}