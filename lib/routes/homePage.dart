import 'package:flutter/material.dart';
import 'package:swasthyam/routes/diseaseInput.dart';
import 'package:swasthyam/routes/symptomsInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swasthyam/routes/testInput.dart';

// homePage.dart: Defines the UI of the home page of the app. Contains a Static AppBar, TabBar and a TabViewController.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Swasthyam'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Symptoms', icon: FaIcon(FontAwesomeIcons.heartbeat),),
                Tab(text: 'Tests', icon: FaIcon(FontAwesomeIcons.thermometerHalf)),
                Tab(text: 'Test Results', icon: FaIcon(FontAwesomeIcons.userMd)),
              ],
            ),
          ),
          body: TabBarView(
              children: [
                SymptomsInput(),
                DiseaseInput(),
                TestInput()
              ]
          ),
        )
      )
    );
  }
}
