import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  
  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  String _email = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0), 
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Enter an email';
                  }
                },
              ),
              TextFormField(
                obscureText: true,
                onSaved: (value) => _password = value,
                validator: (value) {
                  if(value.isEmpty) {
                    return 'Enter an password';
                  }
                }
              ),
              RaisedButton(
                child: Text('Sign Up'),
                onPressed: () => _signUpUser(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _signUpUser() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // print('valid!!');
      Uri uri = Uri.parse('http://192.168.137.1:8080/api/register');
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.fields['email'] = _email;
      request.fields['password'] = _password;
      request.send().then((response) {
        print(response.statusCode);
        print(response.stream);
      });
    }
    // TODO sign user up
  }
}