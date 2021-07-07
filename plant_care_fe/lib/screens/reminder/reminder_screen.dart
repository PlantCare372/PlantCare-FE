import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_app/notification_service.dart';
import 'package:http/http.dart';
import 'package:plant_app/utils/loginCredentials.dart';
import 'dart:convert';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  List listRes;
  Timer timer;
  Future<int> counter1;
  int counter;
  String reminderTimeHour;
  String reminderTimeMinute;
  String reminderTimeSeccond;

  void initState() {
    getReminder();
    startTime();
    super.initState();
  }

  void startTime() async {
    timer = await Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (int.parse(reminderTimeSeccond) >= 0) {
          if (int.parse(reminderTimeSeccond) > 0) {
            int newreminderTimeSeccond = int.parse(reminderTimeSeccond);
            newreminderTimeSeccond--;
            reminderTimeSeccond = newreminderTimeSeccond.toString();
          } else {
            if (int.parse(reminderTimeMinute) >= 0) {
              if (int.parse(reminderTimeMinute) > 0) {
                reminderTimeSeccond = '60';
                int newreminderTimeMinute = int.parse(reminderTimeMinute);
                newreminderTimeMinute--;
                reminderTimeMinute = newreminderTimeMinute.toString();
              } else {
                if (int.parse(reminderTimeHour) >= 0) {
                  if (int.parse(reminderTimeHour) > 0) {
                    reminderTimeMinute = '60';
                    int newreminderTimeHour = int.parse(reminderTimeHour);
                    newreminderTimeHour--;
                    reminderTimeHour = newreminderTimeHour.toString();
                  } else {
                    NotificationService().scheduleNotification();
                    timer.cancel();
                  }
                }
              }
            }
          }
        }
      });
    });
  }

  void addReminder() async {
    Response res = await get(Uri.parse("http://178.128.127.43/api/v1/users/add-reminder/47129"),
        headers: <String, String>{
          'accept': 'application/json',
          'Authorization': 'Bearer ${LoginCredentials.getToken()}'
        });
    print(res.body);
  }

  Future getReminder() async {
    Response res = await get(Uri.parse("http://178.128.127.43/api/v1/users/reminder?plant_id=47129"),
        headers: <String, String>{
          'accept': 'application/json',
          'Authorization': 'Bearer ${LoginCredentials.getToken()}'
        });
    setState(() {
      listRes = json.decode(res.body);
    });
    String newReminder = listRes[0]['detail_reminder_time'].toString().split("T")[0].toString() +
        " " +
        listRes[0]['detail_reminder_time'].toString().split("T")[1].toString();
    int reminderTime = DateTime.parse(newReminder).millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    reminderTime = reminderTime ~/ 1000;
    print(reminderTime);
    reminderTimeHour = (reminderTime ~/ 3600).toString();
    reminderTimeMinute = ((reminderTime % 3600) ~/ 60).toString();
    reminderTimeSeccond = ((reminderTime % 3600) % 60).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${reminderTimeHour} : ${reminderTimeMinute} : ${reminderTimeSeccond}'),
            SizedBox(
              height: 15,
            ),
            Text("Until the next reminder"),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  await addReminder();
                },
                child: Text("Add reminder for this plant"))
          ],
        ),
      ),
    );
  }
}
