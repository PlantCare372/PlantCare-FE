import 'package:flutter/material.dart';
import '../../../constants.dart';

class RecommendPlantCard extends StatelessWidget {
  const RecommendPlantCard(
      {Key key,
      this.image,
      this.title,
      this.country,
      this.price,
      this.press,
      this.bottomPadding})
      : super(key: key);

  final Image image;
  final String title, country;
  final int price;
  final Function press;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: this.bottomPadding,
      ),
      width: size.width * 0.4,
      height: size.height*0.25,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width*0.4 - kDefaultPadding,
            height: 90,
            child:
          image,
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),
                            style: Theme.of(context).textTheme.button),
                        TextSpan(
                          text: "$country".toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
