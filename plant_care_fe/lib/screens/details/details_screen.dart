import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import './components/image_and_icons.dart';
import './components/title_and_price.dart';

// ignore: must_be_immutable

class DetailsScreen extends StatelessWidget {
  String image;
  String title;
  String country;
  int price;

  DetailsScreen(this.image, this.title, this.country, this.price);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            size: size,
            image: this.image,
          ),
          TitleAndPrice(
              title: this.title, country: this.country, price: this.price),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
