import 'package:flutter/material.dart';
import '../components/recomend_plant_card.dart';
import '../../../constants.dart';
import '../../details/details_screen.dart';

class RecommendsPlants extends StatelessWidget {
  final List listRes_recommend;
  const RecommendsPlants({Key key, this.listRes_recommend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return listRes_recommend == null? Container() : GridView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          ),
          itemBuilder: (context, index){
            return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding / 2,
        right: kDefaultPadding / 2,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding *2.5,
      ),
      width: size.width * 0.3,
      child: Column(
        children: <Widget>[
          Container(
            width: size.width*0.4 - kDefaultPadding,
            height: 130,
            child:
          listRes_recommend[index]['image'] == null? Image.asset('assets/images/blank-tree.png') : listRes_recommend[index]['image'],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsScreen(
                  id: listRes_recommend[index]['id'].toString(),
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
                          listRes_recommend[index]['name'].toString(),
                          style: Theme.of(context).textTheme.button,
                          overflow: TextOverflow.ellipsis,
                        ),
                        ),
                        Text(
                          listRes_recommend[index]['country'] == null ? 'No country found' : listRes_recommend[index]['country'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                          color: kPrimaryColor.withOpacity(0.8),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  Spacer(),
                  Text(
                    listRes_recommend[index]['price'] == null? "\$0" : "\$" + listRes_recommend[index]['price'].toString(),
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
          });
  }
}
