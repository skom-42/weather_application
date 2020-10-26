import 'package:flutter/material.dart';

class Seporator extends StatelessWidget {
  Seporator({this.day});
  final int day;

  var days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(days[day]),
      ),
    );
  }
}
