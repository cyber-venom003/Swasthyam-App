import 'package:flutter/material.dart';
import 'package:swasthyam/routes/diabetesInput.dart';

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
          RaisedButton(child: Text("Cardio Vascular"), onPressed: () {}),
          RaisedButton(child: Text("Covid"), onPressed: () {}),
          RaisedButton(child: Text("Pneumonia"), onPressed: () {}),
          RaisedButton(child: Text("Breast Cancer"), onPressed: () {}),
        ],
      ),
    );
  }
}
