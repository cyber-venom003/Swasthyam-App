import 'package:flutter/material.dart';
import 'package:swasthyam/routes/homePage.dart';
import 'package:firebase_core/firebase_core.dart';

// main.dart
// This is the file from where our Flutter Project runs.

// All execution of the project starts from main() function.
void main() {
  runApp(Swasthyam()); // Inflate the given widget and attach it to the screen.
  Firebase.initializeApp(); // Initializes a new FirebaseApp instance by name and options and returns the created app. This method should be called before any usage of FlutterFire plugins.
}

class Swasthyam extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swasthyam App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
