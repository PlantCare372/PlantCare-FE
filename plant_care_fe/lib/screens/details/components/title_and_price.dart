import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key key,
    this.title,
    this.country,
    this.price,
  }) : super(key: key);

  final String title, country;
  final int price;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          Column(
                    children: <Widget>[
                        Container(
                          width: size.width*0.8,
                          child: Text(
                          title,
                          style: Theme.of(context).textTheme
                          .headline5
                          ,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                        Container(
                          width: size.width*0.8,
                          child:
                          Text(
                          country,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor.withOpacity(0.8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                      ],
                    ),
          Spacer(),
          Text(
            "\$$price",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: kPrimaryColor),
          )
        ],
      ),
    );
  }
}
