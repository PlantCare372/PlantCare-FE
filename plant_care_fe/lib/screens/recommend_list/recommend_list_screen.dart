import 'package:flutter/material.dart';
import '../home/components/recomend_plant_card.dart';
import '../details/details_screen.dart';

class RecommendListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Grid List';
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
          children: <Widget>[
            RecomendPlantCard(
              image: "assets/images/image_1.png",
              title: "Samantha",
              country: "Russia",
              price: 440,
              bottomPadding: 0,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),
            RecomendPlantCard(
              image: "assets/images/image_2.png",
              title: "Angelica",
              country: "Russia",
              price: 440,
              bottomPadding: 0,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ),
                );
              },
            ),
            RecomendPlantCard(
              image: "assets/images/image_3.png",
              title: "Samantha",
              country: "Russia",
              price: 440,
              bottomPadding: 0,
              press: () {},
            ),
          ]),
    );
  }
}
