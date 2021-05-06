import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    init();
  }
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  // void changeColor(Color color) => setState(() => currentColor = color);
  // void changeColors(List<Color> colors) =>
  //     setState(() => currentColors = colors);
  static SharedPreferences shrprf;
  static var substr;
  static var po;
  static Color themecolor = Colors.blue;

  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print("pickerColor;;;-$pickerColor");

    substr = pickerColor.toString().substring(10, 16);
    shrprf.setString("ThemeColor", substr);
  }

  static Future init() async {
    shrprf = await SharedPreferences.getInstance();
    if (shrprf.get('ThemeColor') != null) {
      po = int.parse("0xff" + shrprf.get('ThemeColor'));

      themecolor = Color(po);
    } else if (shrprf.get('ThemeColor') == null) {
//      po = int.parse("0xff" + shrprf.get('ThemeColor'));

      themecolor = Color(0xff443a49);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        themecolor = Color(po);
        init();
      });
    });
    var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: themecolor,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _key.currentState.openDrawer();
              }),
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            Stack(children: [
              ClipPath(
                clipper: WaveClipperOne(reverse: false),
                child: Container(
                  height: device.height * 0.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    themecolor,
                    themecolor,
                  ])),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
