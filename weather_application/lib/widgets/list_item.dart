import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class ListItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 20),
            child: Text('Today',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(),
          Item(),
          Divider(
            indent: MediaQuery.of(context).size.width /4,),
          Item(),
          Divider(indent: MediaQuery.of(context).size.width /4,),
          Item(),
          Divider(indent: MediaQuery.of(context).size.width /4,),
          Item(),
          Divider(),
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {

  // Item(this.icon, this.time, this.location, this.temperature);
  // IconData icon;
  // String time;
  // String location;
  // String temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.all(5),
          child: BoxedIcon(WeatherIcons.day_sunny,

          size: 40,
          color: Colors.amber,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15),
          child: Column(
            children: <Widget>[
              Text('13:00',
              style: TextStyle(fontSize: 15),
              ),
              Text('Minsk',style: TextStyle(fontSize: 15),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2.5),
          child: Text('20°',
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