import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class PneumoniaInput extends StatefulWidget {
  @override
  _PneumoniaInputState createState() => _PneumoniaInputState();
}

class _PneumoniaInputState extends State<PneumoniaInput> {
  int pneumoniaRisk = 0;
  void sendRequest(filename) async {
    var request = http.MultipartRequest('POST', Uri.parse("http://192.168.1.7:5000/predict"));
    request.files.add(await http.MultipartFile.fromPath('image', filename));
    request.fields.addAll({
      "disease": "pneumonia"
    });
    try{
      var res = await request.send();
      var body = await res.stream.bytesToString();
      setState(() {
        pneumoniaRisk = jsonDecode(body)['prediction'];
      });
    } catch(e){
      print(e.toString());
    }
  }

  void uploadImage() async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: ImageSource.gallery);
    //final File file = File(image.path);
    sendRequest(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Pneumonia Test Results")
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                onPressed: () {
                  uploadImage();
                },
                child: Container(
                  width: 230,
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Upload XRay Image",
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
              ),
              ListTile(
                  title: Text("Your Pneumonia Risk",
                      style: TextStyle(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  subtitle: pneumoniaRisk > 80 && pneumoniaRisk <= 100 ? Text("High Risk",
                      style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.red
                      )
                  ) : pneumoniaRisk > 40 && pneumoniaRisk < 80 ? Text("Medium Risk",
                      style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.yellow
                      )
                  ) : pneumoniaRisk < 40 && pneumoniaRisk > 20 ? Text("Low Risk",
                      style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.green
                      )
                  ) : Text("Not Detected",
                      style: TextStyle(
                          fontSize: 22.5,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
