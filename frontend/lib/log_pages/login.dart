import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LogIn extends StatefulWidget {
  @override
  LogInState createState() => LogInState();
}

class LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 40.0, left: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: TextFormField(
                      decoration:  InputDecoration(
                        labelText: 'Email',
                        filled: true, 
                        fillColor: Color(0xffd3d3d3),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:10.0),
                    child: TextFormField(
                      decoration:  InputDecoration(
                        labelText: 'Password',
                        filled: true, 
                        fillColor: Color(0xffd3d3d3),
                      ),
                    ),
                  ),
                  Container(
                    width: 500,
                    height: 50,
                    margin: EdgeInsets.only(top:10.0),
                    child: RaisedButton(
                      child: Text('Login'),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}