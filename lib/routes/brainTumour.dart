import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

// brainTumour.dart: Defines a Stateful Widget that takes Brain MRI image from the user gallery
// and returns the tumour risk %. Sends the HTTP MultipartRequest by POST method to a REST API Endpoint.

class TumourInput extends StatefulWidget {
  @override
  _TumourInputState createState() => _TumourInputState();
}

class _TumourInputState extends State<TumourInput> {
  int tumourRisk = 0;
  void sendRequest(filename) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse("http://192.168.1.3:5000/predict"));      // This is local ip of the network on which flask server is running
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    request.fields.addAll({"disease": "brainTumour"});
    try {
      var res = await request.send();
      var body = await res.stream.bytesToString();
      setState(() {
        tumourRisk = jsonDecode(body)['prediction'];
      });
      print(tumourRisk);
    } catch (e) {
      print(e.toString());
    }
  }

  void uploadImage() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    sendRequest(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("MRI Test Results")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.fileInvoice),
                    title: Text("Your Tumour Risk",
                        style: TextStyle(
                          fontSize: 17.5,
                          fontWeight: FontWeight.w500,
                        )),
                    subtitle: tumourRisk > 80 && tumourRisk <= 100
                        ? Text("High Risk ($tumourRisk %)",
                            style: TextStyle(
                                fontSize: 22.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.red))
                        : tumourRisk > 40 && tumourRisk < 80
                            ? Text("Medium Risk ($tumourRisk %)",
                                style: TextStyle(
                                    fontSize: 22.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.yellow))
                            : tumourRisk < 40 && tumourRisk > 20
                                ? Text("Low Risk ($tumourRisk %)",
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
          label: Text("Upload MRI Image"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
