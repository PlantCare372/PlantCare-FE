import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class CustomDialog extends StatelessWidget {
  final String title, des, buttonText;
  final Image image;

  CustomDialog({this.title, this.des, this.buttonText, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 100,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.25),
                blurRadius: 10.0,
                offset: Offset(0.0,10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 24.0),
              Text(des, style: TextStyle(
                fontSize: 16.0, 
                color: kTextColor,
                ),
              ),
              SizedBox(height:24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('OK')),
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 20,
          right: 20,
          child: Stack(
            children: <Widget>[
              Container(
                child: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  radius: 50,
                )
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  height: 95,
                  width: 100,),
              ),
            ],
          ),),
      ],
    );
  }
}