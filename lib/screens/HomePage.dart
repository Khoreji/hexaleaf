import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'Drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  Color currentColor = Colors.limeAccent;
  List<Color> currentColors = [Colors.limeAccent, Colors.green];

  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        key: _key,
        appBar: AppBar(
          backgroundColor: Colors.orange,
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
                    Colors.orangeAccent[400],
                    Colors.orange,
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
