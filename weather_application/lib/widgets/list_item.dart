import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_application/models/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:intl/intl.dart';

class Item extends StatelessWidget {

  final date;
  final temperature;
  final description;
  final main;

  Item({this.date, this.temperature, this.description, this.main});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          // margin: EdgeInsets.only(left: 10),
          child: BoxedIcon(Weather.getTitleLogo(main),
          size: 50,
          color: Colors.amber,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(left: 15),

          child: Column(
            children: <Widget>[
              Text(DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(date * 1000)),
              style: TextStyle(fontSize: 15),
              ),
              Text('$description',style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Container(
          child: Text('${Weather.returnInt(temperature)}°',
          style: TextStyle(
            fontSize: 50,
            color: Colors.blue
          ),
          ),
        )
      ],
    );
  }
}