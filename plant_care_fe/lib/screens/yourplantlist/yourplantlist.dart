import 'package:flutter/material.dart';
import 'package:plant_app/screens/yourplantlist/components/schedulescreen.dart';

import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/recomend_plant_card.dart';

class YourPlantScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = 'Your plants';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(),
    );
  }
}