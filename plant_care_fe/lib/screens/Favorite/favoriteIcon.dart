import 'package:flutter/material.dart';
import 'nextscreen.dart';

class Mainscreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(
    //    leading: IconButton(icon: Icon(Icons.menu), onPressed: (){
    //      //
    //    })
    //    ),
       body: Center(
         child: IconButton(
           icon: Icon(Icons.favorite),
           color: Colors.red,
           iconSize: 30.0,
           hoverColor: Colors.grey,
           onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) => NextScreen()),
            );
           },)
       ),
    );
  }
}