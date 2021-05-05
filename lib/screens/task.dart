import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
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
