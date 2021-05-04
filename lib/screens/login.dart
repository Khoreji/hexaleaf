import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var dw = MediaQuery.of(context).size.width;
    var dh = MediaQuery.of(context).size.height;
    bool toggle = true;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
                      onPressed: () {
                        Navigator.pushNamed(context, "signup");
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
