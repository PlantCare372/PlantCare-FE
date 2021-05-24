import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class CustomButton extends StatelessWidget{
  final Function press;

  const CustomButton(
    {
      Key key,
      this.press,
    }
  ) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return MaterialButton(
      color: kPrimaryColor.withOpacity(0.8),
      onPressed: press,
      child: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}