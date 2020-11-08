import 'package:flutter/material.dart';
import 'package:swasthyam/routes/brainTumour.dart';
import 'package:swasthyam/routes/covidInput.dart';
import 'package:swasthyam/routes/diabetesInput.dart';
import 'package:swasthyam/routes/pneumoniaInput.dart';

class TestInput extends StatefulWidget {
  @override
  _TestInputState createState() => _TestInputState();
}

class _TestInputState extends State<TestInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          RaisedButton(
              child: Text("Diabetes"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiabetesInput()));
              }),
          RaisedButton(child: Text("Covid"), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CovidInput()));
          }),
          RaisedButton(child: Text("Pneumonia"), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PneumoniaInput()));
          }),
          RaisedButton(child: Text("Brain Tumour"), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TumourInput()));
          }),
        ],
      ),
    );
  }
}
