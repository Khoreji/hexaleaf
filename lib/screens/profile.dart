import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Positioned(
                  left: device.width * 0.35,
                  top: device.height * 0.2,
                  width: device.width * 0.3,
                  height: device.width * 0.3,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      )))
            ],
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpeg"),
                  fit: BoxFit.fill)),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
