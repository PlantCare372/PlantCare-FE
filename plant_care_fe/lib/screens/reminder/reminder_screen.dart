import 'package:flutter/material.dart';
import 'package:plant_app/notification_service.dart';

class ReminderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await NotificationService().scheduleNotification();
          },
          child: Text('Test Notification!'),
        ),
      ),
    );
  }
}
