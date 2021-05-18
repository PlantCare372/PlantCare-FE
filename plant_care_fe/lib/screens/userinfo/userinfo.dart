import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

import '../userinfo/components/body.dart';

class UserInfo extends StatelessWidget {
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
      body: Body(),
    );
  }
}