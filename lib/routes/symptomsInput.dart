import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swasthyam/routes/predictedDisease.dart';

class SymptomsInput extends StatefulWidget {
  @override
  _SymptomsInputState createState() => _SymptomsInputState();
}

class _SymptomsInputState extends State<SymptomsInput> {
  List<String> patientSymptoms = [];
  String symptom = null;

  List<Widget> convertToTile(List<String> symptomStrings) {
    List<Widget> symptomTile = [];
    for (int i = 0 ; i < symptomStrings.length ; ++i){
      symptomTile.add(
        Card(
          elevation: 2.5,
          child: ListTile(
            trailing: IconButton(
              icon: FaIcon(FontAwesomeIcons.times , color: Color(0xFFD60000)),
              onPressed: () {
                setState(() {
                  symptomStrings.remove(symptomStrings[i]);
                });
              },
            ),
            title: Text(
              symptomStrings[i],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20.5,
              ),
            ),
          ),
        )
      );
      symptomTile.add(
        SizedBox(
          height: 3,
        )
      );
    }
    symptomTile.add(
        FlatButton(
          onPressed: () {
            Navigator.push(context , MaterialPageRoute(builder: (context) => PredictDisease(symptoms: symptomStrings,)));
          },
          child: Container(
            width: 230,
            height: 45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Predict Disease",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.5,
                    fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26.0),
              color: const Color(0xff3f9bfc),
              border:
              Border.all(width: 1.0, color: const Color(0xff3f9bfc)),
            ),
          ),
        )
    );
    return symptomTile;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Text(
            "Add Symptoms",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 30,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 20,),
          ListTile(
            title: TextField(
              onChanged: (value) {
                setState(() {
                  symptom = value;
                });
              },
              decoration: InputDecoration(
                hintText: "What are you feeling",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  borderSide: BorderSide(color: Color(0xFFD60000) , width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD60000), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFD60000), width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                ),
              ),
            ),
            trailing: IconButton(
                icon: FaIcon(FontAwesomeIcons.plusCircle , color: Color(0xffd60000), size: 30),
                onPressed: () {
                  if(symptom != null && symptom.length != 0) {
                    setState(() {
                      patientSymptoms.add(symptom);
                      symptom = null;
                    });
                  }
                  else {
                    print("No symptom added");
                  }
                },),
          ),
          SizedBox(height: 25,),
          patientSymptoms.length != 0 ? Column(
            children: convertToTile(patientSymptoms),
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "🎉🎉🎉",
                style: TextStyle(
                  fontSize: 40
                ),
              ),
              SizedBox(height: 15,),
              Text(
                "You're all fit 🙂",
                style: TextStyle(
                    fontSize: 40
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
