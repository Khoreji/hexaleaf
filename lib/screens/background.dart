import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Color currentColor = Colors.limeAccent;
List<Color> currentColors = [Colors.limeAccent, Colors.green];

class MyBackgroundColor extends StatefulWidget {
  @override
  _MyBackgroundColorState createState() => _MyBackgroundColorState();
}

class _MyBackgroundColorState extends State<MyBackgroundColor> {
  void changeColor(Color color) => setState(() => currentColor = color);
  void changeColors(List<Color> colors) =>
      setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: RaisedButton(
            elevation: 3.0,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    titlePadding: const EdgeInsets.all(0.0),
                    contentPadding: const EdgeInsets.all(0.0),
                    content: SingleChildScrollView(
                      child: MaterialPicker(
                        pickerColor: currentColor,
                        onColorChanged: changeColor,
                        enableLabel: true,
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text('Change me'),
            color: currentColor,
            textColor: useWhiteForeground(currentColor)
                ? const Color(0xffffffff)
                : const Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
