import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/screens/properties/properties.dart';

import '../../../constants.dart';

class ImageAndIcons extends StatelessWidget {
  const ImageAndIcons({
    Key key,
    this.image,
    this.listRes,

    @required this.size,
  }) : super(key: key);

  final Size size;
  final String image;
  final Map listRes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/sun.svg"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Light",
                            des: listRes['light'].toString(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/icon_2.svg"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Temperature",
                            des: listRes['temperature'].toString(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/icon_3.svg"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Humidity",
                            des: listRes['humidity'].toString(),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/icon_4.svg"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDialog(
                            title: "Wind",
                            des: listRes['wind'].toString(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(63),
                  bottomLeft: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 60,
                    color: kPrimaryColor.withOpacity(0.29),
                  ),
                ],
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  centerSlice: Rect.largest,
                  image: AssetImage(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
