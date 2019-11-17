import 'package:flutter/material.dart';

class NumberCountDemo extends StatefulWidget {
  @override
  _NumberCountDemoState createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<NumberCountDemo> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Number Counter'), backgroundColor: Colors.blueGrey,),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    child: Text('+'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: add,
                  ),
                  Text('${_n}', style: TextStyle(fontSize: 50.0)),
                  RaisedButton(
                    child: Text('-'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    onPressed: minus,
                  )
                ],
              ),
            ],
          )
        )
    );
  }
  int _n = 0;
  void add() {
    setState(() {
      _n++;
  });
  }

  void minus() {
    setState(() {
      if (_n != 0)
        _n--;
    });
  }
}