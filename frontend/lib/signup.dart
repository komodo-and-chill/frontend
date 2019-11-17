import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'tabs/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void _signUpUser() async {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Uri uri = Uri.parse('http://192.168.137.1:8081/api/register');
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.fields['email'] = _email;
      request.fields['password'] = _password;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      var response = await http.Response.fromStream(await request.send());
      var body = json.decode(response.body);
      prefs.setInt('user_id', body['user']['id']);
      print(body['message']);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }
}