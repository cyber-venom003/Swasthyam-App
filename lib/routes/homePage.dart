import 'package:flutter/material.dart';
import 'package:swasthyam/routes/symptomsInput.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                Icon(Icons.ac_unit),
                Icon(Icons.access_alarm)
              ]
          ),
        )
      )
    );
  }
}
