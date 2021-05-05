import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexaleaf/screens/chat/chat.dart';
import 'package:hexaleaf/screens/profile.dart';
import 'package:hexaleaf/screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  _MyNavBarState(){
    init();
  }
static SharedPreferences shrprf;
  static var po;
  static Color themecolor;   
  static Future init() async {
    shrprf = await SharedPreferences.getInstance();
    if(shrprf.get('ThemeColor') != null){
    po = int.parse("0xff" + shrprf.get('ThemeColor'));
    themecolor = Color(po);
    }
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1),(){
      setState(() {
        themecolor = Color(po);
      init();
    });
    });

    return Scaffold(
      body: _children[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: themecolor,
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
