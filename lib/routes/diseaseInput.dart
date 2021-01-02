import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// diseaseInput.dart: Fetches the recommended tests for the disease given as input by user.

class DiseaseInput extends StatefulWidget {
  @override
  _DiseaseInputState createState() => _DiseaseInputState();
}

class _DiseaseInputState extends State<DiseaseInput> {
  String disease = '';
  List listTests = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: ListView(
          children: [
            Text(
              "Add Disease",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                title: TextField(
                  onChanged: (value) {
                    setState(() {
                      disease = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "What are you suffering from? 🤒",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(17.5)),
                      borderSide:
                          BorderSide(color: Color(0xFFD60000), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFD60000), width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFD60000), width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(17.5)),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.diagnoses,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection("diseases")
                        .doc("$disease")
                        .get()
                        .then((value) {
                      setState(() {
                        listTests = value['tests'];
                        print(listTests);
                      });
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              listTests.join("\n"),
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
