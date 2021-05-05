import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Positioned(
              left: device.width * 0.9,
              top: device.height * 0.6,
              width: device.width * 0.6,
              child: Container(child: Text("Chat_Page"))),
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
