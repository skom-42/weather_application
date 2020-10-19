import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';

class DottedLine extends StatelessWidget {
  const DottedLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40, bottom: 20),
      child: FDottedLine(
        color: Colors.grey,
        width: (MediaQuery.of(context).size.width / 3 + 30),
        space: 1.0,
        dottedLength: 6,
      ),
    );
  }
}