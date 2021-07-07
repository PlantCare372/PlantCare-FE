import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../../constants.dart';
import '../../../notification_service.dart';
import '../../reminder/reminder_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class FeaturedPlants extends StatelessWidget {
  FeaturedPlants({
    Key key,
  }) : super(key: key);
  final List<String> featurePlant = <String>["assets/images/bottom_img_1.png", "assets/images/bottom_img_2.png"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: featurePlant
              .map(
                (e) => FeaturePlantCard(
                  image: e,
                  press: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReminderScreen()));
                  },
                ),
              )
              .toList()),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.image,
    this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
