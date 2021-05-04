import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Login extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var authc = FirebaseAuth.instance;
  var email = "";
  var password = "";
  var progress = false;
  @override
  Widget build(BuildContext context) {
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;
    bool toggle = true;
    return ModalProgressHUD(
        inAsyncCall: progress,
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bg.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Positioned(
                    top: dh * 0.17,
                    left: dw * 0.06,
                    child: Text(
                      "Hexaleaf",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: dw * 0.099,
                      ),
                    )),
                Positioned(
                    top: dh * 0.23,
                    left: dw * 0.06,
                    child: Text(
                      "Technologies",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: dw * 0.099,
                      ),
                    )),
                Positioned(
                    left: dw * 0.13,
                    top: dh * 0.38,
                    width: dw * 0.76,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                            fontSize: dw * 0.037,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                      ),
                    )),
                Positioned(
                    left: dw * 0.13,
                    top: dh * 0.49,
                    width: dw * 0.76,
                    child: TextField(
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      obscureText: toggle,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                          child: Icon(Icons.visibility),
                          onTap: () {
                            setState(() {
                              toggle = false;
                            });
                          },
                        ),
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontSize: dw * 0.037,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    )),
                Positioned(
                    left: dw * 0.25,
                    top: dh * 0.64,
                    width: dw * 0.50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if ((email != null && email != "") &&
                            (password != "" && password != null)) {
                          try {
                            setState(() {
                              progress = true;
                            });
                            var user = await authc.signInWithEmailAndPassword(
                                email: email, password: password);
                            print("signin:$email and paassword :$password");
                            if (user != null) {
                              Navigator.pushNamed(context, "home");
                              setState(() {
                                progress = false;
                              });
                            }
                          } catch (e) {
                            setState(() {
                              progress = false;
                            });

                            print(e);

                            if (e.toString() ==
                                "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.") {
                              Fluttertoast.showToast(
                                  msg: "email not exist",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (e.toString() ==
                                "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.") {
                              Fluttertoast.showToast(
                                  msg: "Password is not correct.",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (e.toString() ==
                                " [firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.") {
                              Fluttertoast.showToast(
                                  msg: "Try Again Later",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          }
                        } else {
                          setState(() {
                            progress = false;
                          });

                          Fluttertoast.showToast(
                              msg: "field not be empty",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white)),
                    )),
                Positioned(
                  left: dw * 0.25,
                  top: dh * 0.70,
                  width: dw * 0.50,
                  child: TextButton(
                    child: Text(
                      "Not registered yet?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: null,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
