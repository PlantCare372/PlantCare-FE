import 'package:flutter/material.dart';

import 'package:plant_app/constants.dart';

class CustomDialog extends StatelessWidget {
  final Function press;
  final String msg;

  CustomDialog({Key key, this.press, this.msg, String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 20,
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
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(height: 50, width: 50, child: Image.asset('assets/images/success.png')),
              SizedBox(height: 20),
              Text(
                'CONGRATULATION',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                msg,
                style: TextStyle(
                  fontSize: 20.0,
                  color: kTextColor,
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(onPressed: press, child: Text('OK')),
              )
            ],
          ),
        ),
      ],
    );
  }
}
