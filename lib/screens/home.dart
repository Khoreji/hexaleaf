import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexaleaf/screens/website.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyNavBar(),
    );
  }
}
int currentindex = 0;
final List _children = [
  MyWebsite(),
];
class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentindex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          items: [
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.web, 
              size: 30
            ),
            Icon(
              Icons.person, 
              size: 40
            ),
          ],
          onTap:(index){
                  setState(() {
                    currentindex = index;
                  });
          },
          animationDuration: Duration(milliseconds: 100),
          color: Colors.tealAccent,
          height: 50.0,
        ),
      );
  }
}