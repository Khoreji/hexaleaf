import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(
              child: Text("hello")
            )
          ],
        )
        ,
      ),
    );
  }
}
