import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
    child: Column(
      children: <Widget>[
        Center(
            child: Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/blank-user.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Username',
          style: TextStyle(
            fontSize: 20,
            color: kTextColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          )
        )
      ],
    ),
    );
  }
}