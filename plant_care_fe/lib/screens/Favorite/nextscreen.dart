import 'package:flutter/material.dart';


class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The favorite trees"),
      ),
      body: getListView(),
    );
  }
}

Widget getListView() {
  var listView = ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset('assets/images/image_1.png'),
            title: Text('Đây là cây sample1'),
            subtitle: Text('Rất là dễ trồng1'),
            trailing: Icon(Icons.favorite),
            hoverColor: Colors.grey,
          ),
          ListTile(
            leading: Image.asset('assets/images/image_2.png'),
            title: Text('Đây là cây sample2'),
            subtitle: Text('Rất là dễ trồng2'),
            trailing: Icon(Icons.favorite),
            hoverColor: Colors.grey,
          )
        ]
      );
    return listView;
}