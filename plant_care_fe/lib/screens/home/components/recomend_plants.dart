import 'package:flutter/material.dart';
import 'package:plant_app/screens/details/details_screen.dart';
import './recomend_plant_card.dart';
import '../../../class/reccommend_plants_class.dart';

class RecomendsPlants extends StatelessWidget {
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: plants
            .map((plant) => RecomendPlantCard(
                  image: plant.image,
                  title: plant.title,
                  country: plant.country,
                  price: plant.price,
                  bottomPadding: 20 * 2.50,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(plant.image,
                              plant.title, plant.country, plant.price),
                        ));
                  },
                ))
            .toList(),
      ),
    );
  }
}
