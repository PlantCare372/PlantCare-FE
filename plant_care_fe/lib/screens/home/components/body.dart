import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:http/http.dart';
import 'package:plant_app/utils/loginCredentials.dart';
import 'dart:convert';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';
import 'recomend_plants.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatefulWidget {
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  List listRes_recommend;
  Future fetchData() async {
    Response res = await get(
      Uri.parse('http://178.128.127.43/api/v1/plants/?skip=0&limit=100'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${LoginCredentials.getToken()}'
      },
    );
    if (res.statusCode == 200) {
      setState(() {
        listRes_recommend = json.decode(res.body);
      });
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Recomended", press: () {}),
          SizedBox(
            height: 250,
            child: RecommendsPlants(listRes_recommend: listRes_recommend),
          ),
          TitleWithMoreBtn_YPL(title: "Your plants"),
          FeaturedPlants(),
          SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
