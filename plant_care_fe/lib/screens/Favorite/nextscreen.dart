import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:plant_app/constants.dart';
import 'package:plant_app/utils/loginCredentials.dart';

import '../../constants.dart';
import '../details/details_screen.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreen createState() => _NextScreen();
}

class _NextScreen extends State<NextScreen> {
  List fav;
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    Response res =
        await get(Uri.parse('http://178.128.127.43/api/v1/users/get-favorited-plants'), headers: <String, String>{
      'accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ${LoginCredentials.getToken()}'
    });
    if (res.statusCode == 200) {
      setState(() {
        fav = json.decode(res.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("The favorite trees"),
      ),
      body: GridView.builder(
        itemCount: fav.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding / 2,
              right: kDefaultPadding / 2,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding * 2.5,
            ),
            width: size.width * 0.4,
            child: Column(
              children: <Widget>[
                Container(
                  width: size.width * 0.4 - kDefaultPadding,
                  height: 90,
                  child:
                      fav[index]['image'] == null ? Image.asset('assets/images/blank-tree.png') : fav[index]['image'],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                id: fav[index]['id'].toString(),
                              )),
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
                              width: size.width * 0.4 - kDefaultPadding - 30,
                              child: Text(
                                fav[index]['name'].toString(),
                                style: Theme.of(context).textTheme.button,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              fav[index]['country'] == null ? 'No country found' : fav[index]['country'].toString(),
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
                          fav[index]['price'] == null ? "\$0" : "\$" + fav[index]['price'].toString(),
                          style: Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor),
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
