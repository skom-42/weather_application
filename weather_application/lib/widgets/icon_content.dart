import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:weather_icons/weather_icons.dart';



class IconContent extends StatelessWidget {

  IconContent(@required this.icon, @required this.lable);
  IconData icon;
  String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FDottedLine(
          color: Colors.grey,
          child: BoxedIcon(
            icon,
            color: Colors.amber,
            size: 30,

          ),
        ),
        Text(lable),
      ],
    );
  }
}
