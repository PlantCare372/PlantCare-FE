import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'items.dart';

class ScheduleScreen extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
      ),
      body: Container(
    child: Column(
      children: <Widget>[
        Center(
            child: Column(
              children: <Widget>[
                Container(
              height: MediaQuery.of(context).size.height*0.3,
              width: MediaQuery.of(context).size.width*0.5,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                  color: kPrimaryColor.withOpacity(0.25),
                ),],
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/blank-user.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
                ),
                Text(
          'Tree Name',
          style: TextStyle(
            fontSize: 20,
            color: kTextColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 2,
          )
        ),
              ],
            ),
          ),
        SizedBox(height: 30),
        Text(
          'Calendar',
          style: TextStyle(
            fontSize: 20,
            color: kTextColor,
            fontWeight: FontWeight.bold,
          )
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: ListView(
            children: <Widget>[
              AlarmItem(hour: '3:30', enabled: true),
              AlarmItem(hour: '3:30', enabled: true),
              AlarmItem(hour: '3:30', enabled: true),
            ]
          ),
          ),
        ),
      ],
    ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        showTimePicker(context: context, initialTime: new TimeOfDay(hour: 12, minute: 30));
      },
      backgroundColor: kPrimaryColor,
      child: Icon(Icons.add, size : 20),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}