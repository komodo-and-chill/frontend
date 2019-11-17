import 'package:flutter/material.dart';
import 'package:frontend/log_pages/login.dart';
import 'signup.dart';
import 'package:flutter/services.dart';
import 'tabs/home.dart';
import 'tabs/lefttutils/washer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));   
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: Container(
    //     color: Colors.white,
    //     child: CustomPaint(
    //       painter: CurvePainter(),
    //     )
    //   ),
    // );

    return MaterialApp(
      title: 'App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LogIn(),
      initialRoute: '/',
      routes: {
        '/counter': (context) => NumberCountDemo(),
      }
    );
  }
}