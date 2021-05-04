import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';

class MyReg extends StatefulWidget {
  @override
  _MyRegState createState() => _MyRegState();
}

class _MyRegState extends State<MyReg> {
  var authc = FirebaseAuth.instance;

  var fs = FirebaseFirestore.instance;

  var name;
  int pno;
  var picker = ImagePicker();
  var imgclick;
  var imagepath;
  var imageurl;
  StorageUploadTask tr;
  static var counter = 0;

  var repassword;
  var email;
  var password;
  bool spin = false;
  var url;
  var imgurl;
  var progress = false;

  Future clickphoto() async {
    var picker = ImagePicker();
    var image = await picker.getImage(
      source: ImageSource.camera,
    );

    print('photo clicked');
    print(image.path);
    setState(() {
      imagepath = File(image.path);
    });

    StorageReference fbstorage =
        FirebaseStorage.instance.ref().child("avatarimages").child("$name.jpg");
    print("fbstorage $fbstorage");
    setState(() {
      tr = fbstorage.putFile(imagepath);
    });
    print("tr = $tr");
    progress = true;
    await tr.onComplete.whenComplete(() async {
      imageurl = await fbstorage.getDownloadURL();
      progress = false;
    });

    setState(() {
      url = imageurl;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ModalProgressHUD(
      inAsyncCall: progress,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Column(
                    children: [
                      Text(
                        "HexaLeaf",
                        style: TextStyle(
                            color: Color(0xFFeeeeee),
                            fontSize: size.width * 0.07),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Technologies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFeeeeee),
                            fontSize: size.width * 0.07),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: InkWell(
                      onTap: () async {
                        if ((name != null) && (name != '')) {
                          clickphoto();

                          setState(() {
                            url = url;
                          });
                        } else {
                          Fluttertoast.showToast(
                              msg: "First Fill Your Name",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: CircleAvatar(
                        backgroundImage: url == null
                            ? NetworkImage(
                                'https://cdn4.iconfinder.com/data/icons/business-and-corporation-5/512/875-28-512.png')
                            : NetworkImage(url),
                        maxRadius: 30.0,
                      ),
                    )),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        pno = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(labelText: "Mobile Number"),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: RaisedButton(
                    onPressed: () async {
                      if (name == "" ||
                          pno == null ||
                          email == "" ||
                          password == "") {
                        counter = 0;
                        Fluttertoast.showToast(
                            msg: "All TextField Must Be filled",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else if (name == null ||
                          pno == null ||
                          email == null ||
                          password == null) {
                        counter = 0;
                        Fluttertoast.showToast(
                            msg: "TextFields Cant be Empty",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.TOP,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        if (pno.toString().length == 10) {
                          counter++;
                        } else {
                          Fluttertoast.showToast(
                              msg: "Number must be 10 in no's",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }

                        if (counter >= 0) {
                          if (pno.toString().length != 10) {
                            Fluttertoast.showToast(
                                msg: "Number must be 10 in no's",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.TOP,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          } else {
                            setState(() {
                              progress = true;
                            });

                            try {
                              progress = true;

                              await authc.createUserWithEmailAndPassword(
                                  email: email, password: password);

                              fs.collection('profile').doc('$email').set({
                                'name': name,
                                'phone': pno,
                                'email': email,
                                'url': url,
                              });
                              Fluttertoast.showToast(
                                  msg: "Successfully Registered",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);

                              Navigator.pushNamed(context, "login");
                            } catch (e) {
                              print("exception : $e");
                              if (e.toString() ==
                                  "[firebase_auth/weak-password] Password should be at least 6 characters") {
                                progress = false;

                                Fluttertoast.showToast(
                                    msg:
                                        "password must be at least 6 characters",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              if (e.toString() ==
                                  "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
                                progress = false;
                                counter = 0;
                                Fluttertoast.showToast(
                                    msg: "email already in use",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              } else if (e.toString() ==
                                  "[firebase_auth/invalid-email] The email address is badly formatted.") {
                                Fluttertoast.showToast(
                                    msg: "Email Address is Badly Fomatted",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            } finally {
                              setState(() {
                                progress = false;
                              });
                            }
                          }
                        }
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      width: size.width * 0.5,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(80.0),
                          gradient: new LinearGradient(colors: [
                            Color.fromARGB(255, 255, 136, 34),
                            Color.fromARGB(255, 255, 177, 41)
                          ])),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        "SIGN UP",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () => {Navigator.pushNamed(context, "signup")},
                    child: Text(
                      "Already Have an Account? Sign in",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2661FA)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
