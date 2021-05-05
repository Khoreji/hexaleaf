import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexaleaf/screens/background.dart';
import 'package:hexaleaf/screens/chat/chat.dart';
import 'package:hexaleaf/screens/home.dart';
import 'package:hexaleaf/screens/login.dart';
import 'package:hexaleaf/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "login",
    routes: {
      "login": (context) => Login(),
      "splashscreen": (context) => MySplash(),
      "home": (context) => MyApp(),
      "chat": (context) => ChatApp(),
      "bg": (context) => MyBackgroundColor(),
    },
  ));
}
