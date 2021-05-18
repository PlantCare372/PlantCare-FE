import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The favorite trees Page"),
      ),
      body: getListView(),
    );
  }
}

Widget getListView() {
  var listView = ListView(
        children: <Widget>[
          ListTile(
            leading: Image.asset('asset/image_1.png'),
            title: Text('Đây là cây sample'),
            subtitle: Text('Rất là dễ trồng'),
            trailing: Icon(Icons.favorite),
            hoverColor: Colors.grey,
          )
        ]
      );
    return listView;
}