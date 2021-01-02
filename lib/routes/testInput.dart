import 'package:flutter/material.dart';
import 'package:swasthyam/routes/brainTumour.dart';
import 'package:swasthyam/routes/covidInput.dart';
import 'package:swasthyam/routes/diabetesInput.dart';
import 'package:swasthyam/routes/pneumoniaInput.dart';

// testInput.dart: Defines a stateless widget that gives the list of buttons for checking disease risk
// by uploading test results. As of now, we have only created for 4 diseases.

class TestInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Provide Test Details for any of the following Diseases"),
          ),
          RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Covid",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CovidInput()));
              }),
          RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Diabetes",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiabetesInput()));
              }),
          RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Pneumonia",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PneumoniaInput()));
              }),
          RaisedButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Brain Tumour",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TumourInput()));
              }),
        ],
      ),
    );
  }
}

