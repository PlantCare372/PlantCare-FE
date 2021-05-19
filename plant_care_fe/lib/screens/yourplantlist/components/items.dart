import 'package:flutter/material.dart';

import '../../../constants.dart';

class AlarmItem extends StatelessWidget {
  const AlarmItem({
    Key key,
    this.hour,
    this.enabled
  }) : super(key: key);

  final bool enabled;
  final String hour;

@override 
  Widget build(BuildContext context) {
return Container(
  height: 50,
  margin: EdgeInsets.only(bottom: 20,),
  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [kPrimaryColor, Colors.greenAccent],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
      child: Text(hour, style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.normal,),
          ),
          );
  }
}