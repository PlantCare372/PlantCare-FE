import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../../constants.dart';
import '../details/details_screen.dart';

class Recommend extends StatefulWidget{
  @override 
  RecommendListScreen createState() => RecommendListScreen();
}
class RecommendListScreen extends State<Recommend> {
  List listRes;
  Image image;


  Future fetchData() async{
    Response res = await get(
      Uri.parse('http://178.128.127.43/api/v1/plants/?skip=0&limit=100'),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjIwOTg0MzQsInN1YiI6IjEifQ.DePTdoDHEGvlmMM8GjoAxZIDNunaQm3z1cs8uFUy9uE'
      }
    );
    if (res.statusCode == 200){
      setState(() {
        listRes = json.decode(res.body);
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
    final title = 'Recommend Plants';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: listRes == null? Container() : GridView.builder(
          itemCount: listRes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index){
            return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding *2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width*0.4 - kDefaultPadding,
            height: 90,
            child:
          listRes[index]['image'] == null? Image.asset('assets/images/blank-tree.png') : listRes[index]['image'],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(
                  id: listRes[index]['id'].toString(),
                )
              ),
              );
            },
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
                  Column(
                    children: <Widget>[
                        Container(
                          width: size.width*0.4 - kDefaultPadding - 30,
                          child: Text(
                          listRes[index]['name'].toString(),
                          style: Theme.of(context).textTheme.button,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                        Text(
                          listRes[index]['country'] == null? 'No country found' : listRes[index]['country'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  Spacer(),
                  Text(
                    listRes[index]['price']== null? "\$0" : "\$" + listRes[index]['price'].toString(),
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: kPrimaryColor),
                  )
                ],
              ),
            ),
            ),
        ],
      ),
            );
          },
        ),
      );
  }
}