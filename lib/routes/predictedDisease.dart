import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//predictedDisease.dart: Defines a Stateful widget gives a probabilistic match of diseases
// which matches best with given input symptoms list. Fetches symptom data for each disease from cloud firestore
// and matches it from the list got from symptomsInput.dart for a probabilistic match.

class PredictDisease extends StatefulWidget {
  final List<String> symptoms;
  PredictDisease({@required this.symptoms});
  @override
  _PredictDiseaseState createState() => _PredictDiseaseState();
}

class _PredictDiseaseState extends State<PredictDisease> {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Map<String , int> priorityMap = {};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Predict Disease")
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: _db.collection("diseases").snapshots(),
            builder: (context , snapshot) {
              if(snapshot.hasData){
                final diseases = snapshot.data.docs;
                List<Widget> predictedDiseases = [];
                for(var disease in diseases){
                  final diseaseData = disease.data();
                  priorityMap[disease.id] = 0;
                  for (var symptom in widget.symptoms){
                    if (diseaseData['symptoms'].contains(symptom)){
                      priorityMap[disease.id]++;
                    }
                  }
                }
                for (var key in priorityMap.keys){
                  if (priorityMap[key] > 0){
                    predictedDiseases.add(
                        ListTile(
                          title: Text(
                              "$key",
                              style: TextStyle(
                                fontSize: 20.5,
                                fontWeight: FontWeight.w500,
                              ),
                          ),
                          subtitle: priorityMap[key] > 3 ? Text(
                            "High Probability",
                            style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500,
                                color: Color(0xfff53920)
                            ),
                          ) :  Text(
                            "Low Probability",
                            style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500,
                                color: Color(0xfff2da1f)
                            ),
                          )
                        )
                    );
                  }
                }
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView(
                    children: predictedDiseases,
                  ),
                );
              }
              else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
            },
          )
      ),
    );
  }
}
