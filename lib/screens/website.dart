import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/hl.jpg"), fit: BoxFit.fill)),
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
