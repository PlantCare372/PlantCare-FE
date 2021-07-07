import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/camera/components/api.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final List<dynamic> list;
  const DisplayPictureScreen({
    Key key,
    this.list,
    this.imagePath,
  }) : super(key: key);

  Display createState() => Display();
}

class Display extends State<DisplayPictureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: <Widget>[
          Image.file(
            File(widget.imagePath),
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
                children: widget.list
                    .map((detail) => PlantsDetail(e: detail))
                    .toList(),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class PlantsDetail extends StatefulWidget {
  final dynamic e;
  PlantsDetail({
    Key key,
    this.e,
  }) : super(key: key);

  @override
  PlantsDetailState createState() => PlantsDetailState();
}

class PlantsDetailState extends State<PlantsDetail> {
  bool favpress = true;
  void favButton(int id) async {
    var res = await addtofav(id);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name : ${widget.e['name']}'),
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
                          launchURL(widget.e['google_image']);
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
                          launchURL(widget.e['wikipedia']);
                        }),
                ],
              ),
            ),
            Divider(
              height: 20.0,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(kDefaultPadding),
        ),
        Center(
          child: IconButton(
              icon: favpress
                  ? Icon(Icons.favorite_border)
                  : Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                if (favpress) {
                  favButton(widget.e['id']);
                }
                setState(() {
                  favpress = false;
                });
              }),
        ),
      ],
    );
  }
}
