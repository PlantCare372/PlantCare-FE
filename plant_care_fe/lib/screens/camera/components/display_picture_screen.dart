import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final List<dynamic> list;
  const DisplayPictureScreen({
    Key key,
    this.list,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: <Widget>[
          Image.file(
            File(imagePath),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 300,
            fit: BoxFit.fill,
          ),
          Divider(
            height: 10,
            color: Colors.green[50],
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    list.map((detail) => PlantsDetail(e: detail)).toList(),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class PlantsDetail extends StatelessWidget {
  final dynamic e;
  const PlantsDetail({
    this.e,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Name : ${e['name']}'),
        RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Images: ',
                style: new TextStyle(color: Colors.black),
              ),
              new TextSpan(
                  text: 'Click here to view images',
                  style: new TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchURL(e['google_image']);
                    }),
            ],
          ),
        ),
        RichText(
          text: new TextSpan(
            children: [
              new TextSpan(
                text: 'Description: ',
                style: new TextStyle(color: Colors.black),
              ),
              new TextSpan(
                  text: 'Click here to view detail',
                  style: new TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchURL(e['wikipedia']);
                    }),
            ],
          ),
        ),
        Divider(
          height: 20.0,
        )
      ],
    );
  }
}
