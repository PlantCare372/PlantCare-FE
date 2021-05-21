import 'package:flutter/material.dart';
import 'package:plant_app/screens/yourplantlist/components/schedulescreen.dart';

import 'package:plant_app/constants.dart';
import 'package:plant_app/screens/home/components/recomend_plant_card.dart';
import 'package:plant_app/class/reccommend_plants_class.dart';

class YourPlantScreen extends StatelessWidget {
  List<Plant> plants = [
    Plant(
      image: "assets/images/image_1.png",
      title: "Samantha",
      country: "Russia",
      price: 440,
    ),
    Plant(
      image: "assets/images/image_2.png",
      title: "Angelica",
      country: "Russia",
      price: 440,
    ),
    Plant(
      image: "assets/images/image_3.png",
      title: "Samantha",
      country: "Russia",
      price: 440,
    )
  ];
  @override
  Widget build(BuildContext context) {
    final title = 'Your plants';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            // mainAxisSpacing: 20,
            childAspectRatio: MediaQuery.of(context).size.width *
                1.5 /
                (MediaQuery.of(context).size.height),
            // Generate 100 widgets that display their index in the List.
            children: plants
                .map((plant) => RecomendPlantCard(
                      image: plant.image,
                      title: plant.title,
                      country: plant.country,
                      price: plant.price,
                      bottomPadding: 0,
                      press: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScheduleScreen(),
                            ));
                      },
                    ))
                .toList()));
  }
}