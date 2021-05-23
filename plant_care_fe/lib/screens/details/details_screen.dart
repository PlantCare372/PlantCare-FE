import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import './components/image_and_icons.dart';
import './components/title_and_price.dart';
import './components/description_box.dart';
import 'package:http/http.dart';
import 'dart:convert';
// ignore: must_be_immutable

class DetailsScreen extends StatefulWidget {
  final String id;
  DetailsState createState() => DetailsState(id);
  
  const DetailsScreen({
    Key key, this.id
    }) : super(key : key);
}
class DetailsState extends State<DetailsScreen>{
  String id;
  DetailsState(this.id);
  Map listRes;
  Future fetchData() async{
    Response res = await get(
      Uri.parse('http://178.128.127.43/api/v1/plants/' + this.id),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjIwOTg0MzQsInN1YiI6IjEifQ.DePTdoDHEGvlmMM8GjoAxZIDNunaQm3z1cs8uFUy9uE'
      }
    );
    if (res.statusCode == 200){
      setState((){
        listRes = json.decode(res.body);
      });
    }
  }

  @override
  void initState(){
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return listRes == null? Container() : Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(
            listRes: listRes,
            size: size,
            image: listRes['image'] == null? 'assets/images/blank-tree.png' : listRes['image'].toString(),
          ),
          TitleAndPrice(
              title: listRes['name'].toString(),
              country: listRes['country'] == null ? 'No country found' : listRes['country'].toString(),
              price: listRes['price'] == null? 0 : listRes['price'],
              ),
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Description(
                              title: listRes['name'],
                              text: 'Description',
                              descriptions:
                                listRes['description'].toString());                       
                    });
                  },
                  child: Text("Description"),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
