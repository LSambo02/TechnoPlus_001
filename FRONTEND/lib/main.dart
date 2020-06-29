import 'package:flutter/material.dart';
import 'package:technoplus_CRUD/screens/home.dart';
import 'package:technoplus_CRUD/screens/login.dart';
import 'package:technoplus_CRUD/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'technoplus_CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp()
      },
    );
  }
}
