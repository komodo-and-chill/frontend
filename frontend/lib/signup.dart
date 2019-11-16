import 'package:flutter/material.dart';

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
      print('valid!!');
    }
    // TODO sign user up
  }
}