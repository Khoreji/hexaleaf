import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// create some values
Color pickerColor = Color(0xff443a49);
Color currentColor = Color(0xff443a49);

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  _MyDrawerState() {
    init();
    init();
  }
  static SharedPreferences shrprf;
  static var substr;
  static var po;
  static Color colorkhudka;
// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print("pickerColor;;;-$pickerColor");

    substr = pickerColor.toString().substring(10, 16);
    shrprf.setString("ThemeColor", substr);
  }

  static Future init() async {
    shrprf = await SharedPreferences.getInstance();

    po = int.parse("0xff" + shrprf.get('ThemeColor'));

    colorkhudka = Color(po);
    currentColor = colorkhudka;
    pickerColor = currentColor;
  }

  @override
  Widget build(BuildContext context) {
    void ram() {
      init();
    }

    setState(() {
      pickerColor = currentColor;
      ram();

      currentColor = currentColor;
      print("currentcolor-=-089654$currentColor");
      print("colorkhudka-=-089654$colorkhudka");
      init();
    });

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: pickerColor,
              //   image: DecorationImage(
              //     fit: BoxFit.fill,
              //   image: AssetImage('assets/images/hl.jpg'))
            ),
            child: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Background'),
            onTap: () => {
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
              ),
//              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
