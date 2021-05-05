import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexaleaf/colors.dart';
import 'package:hexaleaf/screens/chat/chat.dart';
import 'package:hexaleaf/screens/profile.dart';
import 'package:hexaleaf/screens/HomePage.dart';

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
  HomePage(),
  ChatApp(),
  Profile(),
];

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  Color color = MyTheme.kAccentColor;
  Color color1 = Colors.red;
  Color color2 = Colors.black45;

  @override
  Widget build(BuildContext context) {
    setState(() {
      print("$color$color1$color2");
    });

    return Scaffold(
      body: _children[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: currentindex == 0
            ? color
            : currentindex == 1
                ? color1
                : currentindex == 2
                    ? color2
                    : null,
        items: [
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(Icons.web, size: 30),
          Icon(Icons.person, size: 40),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        animationDuration: Duration(milliseconds: 100),
        color: Colors.white,
        height: 50.0,
      ),
    );
  }
}
