import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CovidInput extends StatefulWidget {
  @override
  _CovidInputState createState() => _CovidInputState();
}

class _CovidInputState extends State<CovidInput> {
  int covidRisk = 0;
  void sendRequest(filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://192.168.1.7:5000/predict"));      // This is local ip of the network on which flask server is running
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    request.fields.addAll({"disease": "covid"});
    try {
      var res = await request.send();
      var body = await res.stream.bytesToString();
      setState(() {
        covidRisk = jsonDecode(body)['prediction'];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void uploadImage() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    print('Image Picked');
    sendRequest(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Covid Test Results")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.fileInvoice),
                    title: Text("Your Covid Risk",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: covidRisk > 80 && covidRisk < 100
                        ? Text("High Risk ($covidRisk %)",
                            style: TextStyle(
                                fontSize: 22.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.red))
                        : covidRisk > 40 && covidRisk < 80
                            ? Text("Medium Risk ($covidRisk %)",
                                style: TextStyle(
                                    fontSize: 22.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.yellow))
                            : covidRisk < 40 && covidRisk > 20
                                ? Text("Low Risk ($covidRisk %)",
                                    style: TextStyle(
                                        fontSize: 22.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green))
                                : Text("Not Detected",
                                    style: TextStyle(
                                        fontSize: 22.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey))),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          icon: FaIcon(FontAwesomeIcons.fileUpload),
          onPressed: () {
            uploadImage();
          },
          label: Text("Upload Chest X-Ray"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
