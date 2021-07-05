import 'dart:async';
import 'dart:io';
import 'package:plant_app/utils/loginCredentials.dart';

import 'components/display_picture_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
            String data = base64.encode(File(image.path).readAsBytesSync());
            final result = await getPlantPrediction(data);
            print(result[0]);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image?.path,
                  list: result,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
    );
  }
}

Future<List<dynamic>> getPlantPrediction(String image) async {
  final Response res = await post(
    Uri.parse('http://178.128.127.43/api/v1/detector/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${LoginCredentials.getToken()}'
    },
    body: jsonEncode(<String, String>{
      'b64image': image,
    }),
  );
  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  } else {
    throw Exception('Failed to get data.');
  }
}

class PlantPrediction {
  final String name;
  final double prob;
  final Uri google_image;
  final Uri wikipedia;
  final int id;
  final String description;
  final String image;

  PlantPrediction({this.name, this.prob, this.google_image, this.wikipedia, this.id, this.description, this.image});
  // factory PlantPrediction.fromJson(Map<String, dynamic> json) {
  //   return PlantPrediction(
  //       name: json['name'],
  //       prob: json['prob'],
  //       google_image: json['google_image'],
  //       wikipedia: json['wikipedia'],
  //       id: json['id'],
  //       description: json['description'],
  //       image: json['image']);
  // }
}
