import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DiseaseInput extends StatefulWidget {
  @override
  _DiseaseInputState createState() => _DiseaseInputState();
}

class _DiseaseInputState extends State<DiseaseInput> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  String disease = '';
  List listTests = [];

  @override
  void initState() {
    super.initState();
  }

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

/*

StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('diseases')
              .doc('breast cancer')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              try {
                List recommendedTests = snapshot.data['tests'];
                print(recommendedTests);
                recommendedTests.forEach(
                  (element) {
                    listTests.add(
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 16, left: 16, top: 12),
                        child: Card(
                          shadowColor: Color.fromRGBO(0, 0, 0, 0.75),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            title: Text(
                              element,
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
                return Container(
                  child: ListView(
                    children: listTests,
                  ),
                );
              } catch (err) {
                return Text("Something Went wrong. 😥");
              }
            }
            return Text("You seems to be fit.🏃‍♀️🏃‍♂️");
          },
        ):Text("You seems to be fit.🏃‍♀️🏃‍♂️")
      

*/
