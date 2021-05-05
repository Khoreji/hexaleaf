import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _ProfileState() {
    //  getdata();
  }
  static Color themecolor;
  static var savedusername = "";
  static SharedPreferences shrprf;
  static var fsconnect = FirebaseFirestore.instance;
  static var name = "";
  static var email = "";
  static var pno = '';
  static var imgurl = "";
  static var workas = "";
  static var substr;
  static var po;
  static var progress = false;
  getdata() async {
    var data = await fsconnect
        .collection('TeamProfile')
        .doc('info')
        .collection('$savedusername')
        .doc('$savedusername')
        .get();
    setState(() {
      name = "${data.get('name')}";
      email = "${data.get('email')}";
      pno = "${data.get('pno')}";
      workas = "${data.get('WorkAs')}";
      imgurl = "${data.get('imgurl')}";
    });
  }

  Future init() async {
    shrprf = await SharedPreferences.getInstance();

    savedusername = shrprf.getString("username");

    if (shrprf.get('ThemeColor') != null) {
      po = int.parse("0xff" + shrprf.get('ThemeColor'));

      themecolor = Color(po);
    }

    getdata();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        init();
      });
    });

    var device = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: progress,
          child: Container(
            child: Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(reverse: false),
                  child: Container(
                    height: device.height * 0.4,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      themecolor,
                      themecolor,
                    ])),
                  ),
                ),
                Positioned(
                    left: device.width * 0.35,
                    top: device.height * 0.29,
                    width: device.width * 0.3,
                    height: device.width * 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage("$imgurl")),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    )),
                Positioned(
                    top: device.height * 0.45,
                    left: device.width * 0.15,
                    width: device.width * 0.7,
                    //       height: device.height * 0.45,
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            "$name",
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Text(
                            "$workas",
                            style: GoogleFonts.oswald(
                              textStyle: TextStyle(
                                fontSize: 14,
                                //     fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: device.height * 0.58,
                    left: device.width * 0.036,
                    width: device.width * 0.9,
                    height: device.height * 0.35,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: device.width * 0.9,
                            height: device.height * 0.1,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.email,
                                  size: 37,
                                  color: themecolor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Email:",
                                        style: GoogleFonts.abel(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "$email",
                                        style: GoogleFonts.abel(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.bold,
                                            color: themecolor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 15,
                              ),
                            ]),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(left: 12),
                    )),
                Positioned(
                    top: device.height * 0.72,
                    left: device.width * 0.036,
                    width: device.width * 0.9,
                    height: device.height * 0.35,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: device.width * 0.9,
                            height: device.height * 0.1,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Icon(
                                  Icons.phone,
                                  size: 37,
                                  color: themecolor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Mobile no:",
                                        style: GoogleFonts.abel(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "$pno",
                                        style: GoogleFonts.abel(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            //fontWeight: FontWeight.bold,
                                            color: themecolor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 15,
                              ),
                            ]),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(left: 12),
                    )),
              ],
            ),
            height: double.infinity,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
