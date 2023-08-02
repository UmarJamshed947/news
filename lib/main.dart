import 'package:flutter/material.dart';
import 'package:news/views/home.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white, // Set the background color of the AppBar to white
        ),
      ),
      home: Home(),
    );
  }
}


