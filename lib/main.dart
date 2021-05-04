import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexaleaf/screens/login.dart';
import 'package:hexaleaf/screens/signup.dart';
import 'package:hexaleaf/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "signup",
    routes: {
      "login": (context) => Login(),
      "signup": (context) => MyReg(),
      "splashscreen": (context) => MySplash(),
    },
  ));
}
