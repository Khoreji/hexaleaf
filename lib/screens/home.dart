import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
        items: [
          Icon(Icons.add, size: 30,),
          Icon(Icons.web, size: 30),
          Icon(Icons.person, size: 40),
        ],
        animationDuration: Duration(milliseconds: 100),
        color: Colors.tealAccent,
        height: 50.0,
        ),
      ),
    );
  }
} 