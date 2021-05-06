import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: null,
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
