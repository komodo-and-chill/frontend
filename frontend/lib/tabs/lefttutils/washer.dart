import 'package:flutter/material.dart';

class NumberCountDemo extends StatefulWidget {
  @override
  _NumberCountDemoState createState() => _NumberCountDemoState();
}

class _NumberCountDemoState extends State<NumberCountDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Number Count')),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: add,
                child: Icon(Icons.add, color: Colors.black),
                backgroundColor: Colors.white,),
              Text ('$_n', style: TextStyle(fontSize: 60.0)),
              FloatingActionButton(
                onPressed: minus,
                child: Icon(
                  IconData(0xe15b, fontFamily: 'MaterialIcons'),
                color: Colors.black),
                backgroundColor: Colors.white,
              )
            ],
          ),
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